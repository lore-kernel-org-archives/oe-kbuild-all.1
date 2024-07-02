Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D8A1BC094
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 16:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719938206; cv=none; b=BCzFtav1wR4V4XWXb2CM4s7uqd+zzEozAJDVKVHSlLw98duyfodKHyX26kbguuCPR7u4XBUPWBA3UTZMXbIJ3yCPssJn7kXc+Akg3f5FQYFCmQhh+hOw1LILKKATrnkk8AaQOEYPDjC4T/tl4AF7NGvGthnb/OhUPwjetVEA7C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719938206; c=relaxed/simple;
	bh=VA1G22MYa3DOQuIepN4vb8cP9KZg3H4Yw0eZF7KjPYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPtkOgQHwpbxBPoWem5vkSqcKJocA7clDfzM7qSUhBxSolo8zaUdSN8Ep1pXaW0W+ru4wpQttXcdPrAuCWSPjXNhSVGoCtaKI0Fvl2ITX3eqxB6loN55lPhQAmlmOAuK5ORdI5aWBq7T9n2CiVfK2WqqAro8Lm9GvyZS3Phb0F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p576ZSWl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p576ZSWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B880DC116B1;
	Tue,  2 Jul 2024 16:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719938205;
	bh=VA1G22MYa3DOQuIepN4vb8cP9KZg3H4Yw0eZF7KjPYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p576ZSWl4Zi8MFxfmNoo8qz+uNyLObvHd2i7ZBpsMiOv1eiP4q49uvxGcs+X9MQ27
	 j+yx5+B3OyfxbLyLNTt0kerJd9JIMSog7Nmq4PLIFpdQLeHH8PesTkBE208+6lB6OI
	 Z5QsvhGylmMNZ3WqtZ7xdxr9K9QKri9lSwjQZtGu6+JOcIcc91IdKeBrZV88zllFNj
	 eEb5nTVvFdrUHrRS6Y+kO4VJN/5+Rt2ZNf180AB4wEFvIcPBj5+J7Wh8ef4QYeYp7v
	 9V98OcFyicPxx/OyoqFkB8F2swc+bd2t+YlFrZb/tWeaeGb5JplAa11pkIEIKfyLr4
	 yMLXOSh1VaE+A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sOgUl-0000000048n-0zzy;
	Tue, 02 Jul 2024 18:36:43 +0200
Date: Tue, 2 Jul 2024 18:36:43 +0200
From: Johan Hovold <johan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [qcom:arm64-fixes-for-6.10 6/11]
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: touchscreen@10:
 compatible:0: 'elan,ekth5015m' is not one of ['elan,ekth6915',
 'ilitek,ili2901']
Message-ID: <ZoQsm69MaAOGzGTt@hovoldconsulting.com>
References: <202407021718.P1h5gQRY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202407021718.P1h5gQRY-lkp@intel.com>

On Tue, Jul 02, 2024 at 05:30:11PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-fixes-for-6.10
> head:   af355e799b3dc3dd0ed8bf2143641af05d8cd3d4
> commit: 7bfb6a4289b0a63d67ec7d4ce3018cb4a7442f6a [6/11] arm64: dts: qcom: sc8280xp-x13s: fix touchscreen power on
> config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240702/202407021718.P1h5gQRY-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
> dtschema version: 2024.6.dev3+g650bf2d
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240702/202407021718.P1h5gQRY-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407021718.P1h5gQRY-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: touchscreen@10: compatible:0: 'elan,ekth5015m' is not one of ['elan,ekth6915', 'ilitek,ili2901']
>    	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
> >> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: touchscreen@10: compatible: ['elan,ekth5015m', 'elan,ekth6915'] is too long
>    	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
> >> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: touchscreen@10: 'no-reset-on-power-off' does not match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>    arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: /soc@0/geniqup@9c0000/i2c@990000/touchscreen@10: failed to match any schema with compatible: ['elan,ekth5015m', 'elan,ekth6915']

This is only any issue with Bjorn's branch. The new compatible string is
already in mainline.

Johan
