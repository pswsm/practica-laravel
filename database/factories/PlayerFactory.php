<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Model>
 */
class PlayerFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
			'name' => $this->faker->firstName(),
			'surname' => $this->faker->lastName(),
			'yearOfBirth' => $this->faker->numberBetween(2023 - 40, 2023 - 16),
			'salary' => $this->faker->randomNumber(6, true)
        ];
    }
}
