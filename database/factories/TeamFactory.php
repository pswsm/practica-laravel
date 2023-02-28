<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Model>
 */
class TeamFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
	{
		$categories = ['International', 'National', 'Local'];
		$team_suffixes = ['FC', 'CF', 'Assoc', 'AS', 'UE', 'United', 'AE'];
        return [
			'name' => $this->faker->city() . ' ' . $this->faker->randomElement($team_suffixes),
			'coach' => $this->faker->firstName() . ' ' . $this->faker->lastName(),
			'category' => $this->faker->randomElement($categories),
			'budget' => $this->faker->randomNumber(7, true)
        ];
    }
}
