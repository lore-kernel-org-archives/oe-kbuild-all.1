Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978FBD26A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 22:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720389808; cv=none; b=YpZorXoJuvW4+EKLadUwztqSpss4eVAXMuD5uE9+kC7qtKh78pHQbvfDPiHDy+n5drg7SBUby4TCm2vJIzeF8z/J+UjiqYRvsfGjhUKNgPOVlkkCcaZgkuG0lPmKg0vv7Kjdu7CD1tqlvhQQp5z0oPkOSZrQU7BmVrgKiRHvoGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720389808; c=relaxed/simple;
	bh=7K8v8PNC3xH94sunr8Vsmyk9aW9K4Nu0kAj0zCbOf3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jwRmC9BWCPa0CRSczZyCw3WCTPl/n6mntWwJw+PupDG6VTliYuafvYzQKcQSAXollReV6tW7GevA4jNm6fzHy03+NodgRSgEapJ4yJRm5jqhL3aMveZ0iH3zV7nMm5qgEpZ2zZYLVKhDsMmWIGYz8mrtyVVVFLP56TMdVy2fH9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VG7G5JCU; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VG7G5JCU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720389799;
	bh=7K8v8PNC3xH94sunr8Vsmyk9aW9K4Nu0kAj0zCbOf3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VG7G5JCUWecaBBXlpvOrf2W8TweA2jsoZlT8ESheoZpxSYSACRCN8bPAfAuNLXCqR
	 6A5OhVJrvRvY8V1VC7l6NyAWcRlZJFm6hpyVGthQeILxNAqpPzJb5vPfWfTMAl94Vn
	 1R+HIiUqghSNTt6NILay9+tVTNGo3I/SWIakOdUHBxh5+qkvq51nyR/5YfENDJjc7Y
	 xvbrbTSkg+D1Yjpld+XQ6LiJkleVNdptQLsT6K12oGchX6/+XiH78/zpisXJ9dygHH
	 NzxFjPWlIKxXjwJD3MK7gyf+oLRrCT6fHgkyb/TDlpn4wXcJ9nSNtvVY9q9fjqRKOo
	 jFVqsZq1Fh+9w==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DDBB337800C9;
	Sun,  7 Jul 2024 22:03:18 +0000 (UTC)
Message-ID: <021824e9-3f8c-4fa7-a6a0-4a115c759e00@collabora.com>
Date: Mon, 8 Jul 2024 01:03:18 +0300
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [soc:rockchip/dt 39/42]
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: pmic@20: '#sound-dai-cells',
 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks' do not
 match any of the regexes: 'pinctrl-[0-9]+'
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
References: <202406301625.cTliyKZ1-lkp@intel.com> <11100802.5MRjnR8RnV@diego>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <11100802.5MRjnR8RnV@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/6/24 3:16 PM, Heiko Stübner wrote:
> Am Sonntag, 30. Juni 2024, 11:04:21 CEST schrieb kernel test robot:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git rockchip/dt
>> head:   9417909e253ffa57f014822a79cca9b1f2b25492
>> commit: 406a554b382200abfabd1df423a425f6efee53e0 [39/42] arm64: dts: rockchip: Drop invalid mic-in-differential on rk3568-rock-3a
>> config: arm64-randconfig-051-20240630
>> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
>> dtschema version: 2024.6.dev3+g650bf2d
>> reproduce (this is a W=1 build):
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202406301625.cTliyKZ1-lkp@intel.com/
>>
>> dtcheck warnings: (new ones prefixed by >>)
>>>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: pmic@20: '#sound-dai-cells', 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> this is already fixed with the binding change in linux-next and dtbs check
> does not show the issue anymore

Thanks, Heiko!

Indeed, the required binding changes were not applied at that time.
So I was waiting for them to get merged and retest, but you just beat me
to it. :)

Regards,
Cristian
