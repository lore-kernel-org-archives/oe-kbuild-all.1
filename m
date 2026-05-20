Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9154B3CC314;
	Fri, 22 May 2026 10:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445364; cv=none; b=IfRGIL/Dp0dvRXs9COVEewN79+JYZJCxtqUsTrYkTrfttJe4kFwAj3g2oI8+kWoatGsl++dT3uAWid+NsBc7l8iASp5/PeefGQgHzuk5NeZHVr44CWV7D8M8/AZj49pEO/aMBaJqx8/fiuxwmU7JvCXxy1FxvqWKXcI/0axXeLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445364; c=relaxed/simple;
	bh=vdw5OJmtlvU4KXEfERNCSAJsIsp5n+CXwsOvQIybgD0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YQV93IFv7abHP256v7qMkRA6VinLJb+mkv8eDfxaBxCC/B5guPSUOQa0BKlTYaAZz/9yLwYE5e8n7Uxa4rf/6+MXAIwPhhXpWGYDQmBm/KEFODO5RV3RUSJQxkrL2DOjc58NoyAT6gcIcqMDETlSXMnIB+fdkL+VYyoedoUUq3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etHX5CB1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etHX5CB1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9661F000E9;
	Fri, 22 May 2026 10:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445363;
	bh=Y5cL3/Y974E6irBmw6RTQWeMkCz+c5eunAipgwlqVhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=etHX5CB1TMqMFKy7Ex4WaYclXU8E5X00oFs/+fB7nKR3Wio5tZinxt41ysR7h9XDD
	 LWYpFhgeRLoJ8TtcePdflcp66F7Y3MxZmTzzzQi/luXIpES9a68KofsnPlGhrMWpMd
	 SvvEHBmLPjt6VAg93RHlAkMX7EiBsCL3kth6tuJm6OcqeewF7mRGCvovfs8S2c1PzG
	 IzEh7MnykU8lMWuoaI+u8/lqeynW7iV1D0DSw6cHEuX0bCDrDAu/TfYAqHbxpAVye8
	 T+4TsubSHcgHGqrUt5wKCtNt0SYWXYBFvK8/Dv6Ja0eT/NUzA2Og6yYiErtB9rpcbV
	 kqWCRQI/ntwXA==
From: Mark Brown <broonie@kernel.org>
To: Nishanth Sampath Kumar <nissampa@cisco.com>
Cc: lkp@intel.com, linux-kernel@vger.kernel.org, 
 oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260519220557.1574954-1-nissampa@cisco.com>
References: <20260519220557.1574954-1-nissampa@cisco.com>
Subject: Re: [PATCH v2] regmap-i2c: fix sparse warning in
 regmap_smbus_word_write_reg16
Message-Id: <177927833159.56665.18353257746286214650.b4-ty@b4>
Date: Wed, 20 May 2026 12:58:51 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vdw5OJmtlvU4KXEfERNCSAJsIsp5n+CXwsOvQIybgD0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC5xepiI71zsHEvtrW4bqKfI8aD6IvF95GAjV
 8BbWTKPlWCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAucQAKCRAk1otyXVSH
 0JR0B/9ZHco527VlZdiAmANV3J8I7arKgr8EBXbzKD3uJTWdbOXqmRxXQjsAOkHoj4Z+bU0udIR
 xlS0pBg/UUT9xjBq9EsFzPXtS9SmVuRR3a0HHpIYRPwXXZHdRBE9FmK1HSDJVo691+oPSCLDmUO
 7uJEZXvhHc0tDLb/jWRfS8Vebx+ktchDUhCaQIHmym5vLlPnD4cJynU25Ci3WUewQGcSvwFsJCo
 nJYUJD3yZlwAr7xHx/7icx3eG7kGs4X4odz589Dvu2/cUg2KJ0GUQd4FfAcmSS6xY9xUvjivqos
 n6ZyVoB8a/caVi5iyuf/Ne3L9KZSN95gKqrYxauW50uhGynT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 19 May 2026 15:05:57 -0700, Nishanth Sampath Kumar wrote:
> regmap-i2c: fix sparse warning in regmap_smbus_word_write_reg16

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.2

Thanks!

[1/1] regmap-i2c: fix sparse warning in regmap_smbus_word_write_reg16
      https://git.kernel.org/broonie/regmap/c/19a5211cda12

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

