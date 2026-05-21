Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0103A356761;
	Thu, 21 May 2026 22:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779403315; cv=none; b=W/mHBBrX6S4IDfDK11kr+HT4JWD1Ztuf5FwUMFdqRrLmq190sh+93YAphudli7Wuk0iVqG3vtvV3wK9RfXKUjIeEEcKq/WNBi4AQr8Il4tOcRhshGQnjASAc2BCWX9ohMXpAqsqXs/zrXoakAXkYTDVjjqR9z33jEwPibv4JDHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779403315; c=relaxed/simple;
	bh=N+DuvDC4YQUdJgy3bIj7N6gdkUWwTJI9o8CX9cS+Zi8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IhbNtrxx2iikp9hECztCeFHyDhlow2YrlHruBORbN9H9JMfXbiZO5+VOSsADFFQsNr5foM+F5XqKRLkWdkKzreTutBvE7Kcfzlci4UmOTddbI+6VQg3b1gwNobsJt8x89QQ+qoHcpn8bAfF90P4spieTSt/smIzsstNf4F9hYPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j++Xxl5O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j++Xxl5O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D281F000E9;
	Thu, 21 May 2026 22:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779403313;
	bh=dP9WztdvKsjUiX+s5hkKf7m4cBGkGpJR4f2cWaJmZoQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=j++Xxl5OrsrTA/oPJjqVhRGPVnpqWRBE0Izz6nd+5J1KvjgGJUJFIFJ1SP/TVcQI3
	 CEEeZxExzs2BEIF1zhdVkwYt4jIqlhjoTEAJJzf2hVvpvSTumQZXZmsTrD9IM/qlBL
	 RJG63kKXowV5d34x0/naW0dIIOSFK3tdRuxfePWW+fs6eFyGnyNS4Wt1Y3Wavg5O8v
	 E/DnYbSxYCV/KYyhg0HnO3Ub1KQ6suvASI7++4sEFX6m+X7c1BAa0QBE9L3KIyHN5P
	 KZ8rEY9SS3LgpdL/EUGZE6V7CUI82LMidISl7WQLBTrpezlFovrKUAJlhQITDjy93a
	 6TbrV0uKlpo7A==
From: Mark Brown <broonie@kernel.org>
To: Nishanth Sampath Kumar <nissampa@cisco.com>
Cc: lkp@intel.com, linux-kernel@vger.kernel.org, 
 oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260520151109.2380894-1-nissampa@cisco.com>
References: <20260520151109.2380894-1-nissampa@cisco.com>
Subject: Re: [PATCH v2] regmap-i2c: fix sparse warning in
 regmap_smbus_word_write_reg16
Message-Id: <177940331240.1798514.9969087724723460747.b4-ty@b4>
Date: Thu, 21 May 2026 23:41:52 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Wed, 20 May 2026 08:11:09 -0700, Nishanth Sampath Kumar wrote:
> i2c_smbus_write_word_data() expects a plain u16, but cpu_to_le16()
> returns __le16 (a sparse-restricted endian type), causing:
> 
>   drivers/base/regmap/regmap-i2c.c:340: sparse: incorrect type in
>   argument 3 (different base types)
>     expected unsigned short [usertype] value
>     got restricted __le16 [usertype]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap-i2c: fix sparse warning in regmap_smbus_word_write_reg16
      https://git.kernel.org/broonie/misc/c/34808ac8ddaf

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

