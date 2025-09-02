Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C613F2C21CB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817114; cv=none; b=snSKLrABb4FgWkxo2jCqg6n2kGouXSA4AcGwoBmChTx5IwjNiZucTu4LBTNK5N7ujBXBqwFGGUvfId7ZLFHoCtg9bZt2h+cMhaQTGVK+OphlGIbP0qF7RJcr7PD6G95dJ0hCeqRm/EcNxSTg7CLkUuWI8p2am7E7pfL8KwVKgIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817114; c=relaxed/simple;
	bh=l951ZK4S1f3tIiSDBShGa468lBAxFCi81zepYBiVkXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrfbjthOMx6G6QbmUdGmDi+dtEj3uh88i2BKPNGeOgUrQiRhCkm71IKtdUb3VHLCzGCJXrH3joBFox7hJl7zsbTwsKqND593tO1ejAJRoPC07YIkdaHVMndHxHaXBNIqlP4ODT64LlYU0aksuryXBdTb0TSsFoC0rOKLz2rSGp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhGP8Ngv; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhGP8Ngv"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76e1fc69f86so4734236b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Sep 2025 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756817111; x=1757421911; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QSVHuT6d5cGpBm458ZOIFLdHsXtW4cGTYDXaMxzLyBk=;
        b=XhGP8NgvTlxxOPaQtPsjOIFCicbdowH6Wi94YqIhZTlosW2cmclJ9J6X5/f61JppgD
         2wL6DL0z77/B25mI+mqbzU90dZh2AmiSjazuzaG3+ezGUPm7S9isrwOY8LX2cXeLIg6T
         OEMxJn3Y+Y6DTL535b9dFDv7oivd8OzssqVWKSTcw2I8oB8CvrVQ+OOLxLLkTR+75XtT
         KpyeWc9YqT7hermDabL5DpeKXXOXfvZaGOxvrlrpNCUSyvA80Lxry4UM6pFW0LGQ5tqg
         o3rZ3n/DVeAQmJq/dLcRlVL7SCCJoFfeJea606Fs89wctPHDtKc5WaZPMhPlZd7bv+Od
         8ODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817111; x=1757421911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSVHuT6d5cGpBm458ZOIFLdHsXtW4cGTYDXaMxzLyBk=;
        b=clvzjB1W6toxZ9grWcmIPSJ2W4hgPOw0MfSlU4x5mUtwkexgOQ64RPb9fl8fjqxZxE
         JfKFMmnlLaAdxeZuVqR8eZetzF5rLospVd1I6Gp59h/Z7whXSyj4irJ4wlpTVG9AlZw4
         2DagonCeA3tbxCwPW5dAensoa0CyYnFFg00fK8WdXYvCgOexBJm2AT8XfT19JAkj4TmF
         PRjbIv7SkkQXZdqZJLbYT7rShnOjVaJ8pfykRFL4YR/fS3Q0IopALVGrtVskaMqCX/7V
         mTwUs6CkJqj+fHF8YvsOlAJcRDLXwxG1nmyTGX1pmmn81cdzc+We4cp0rTFqWLMXHIrM
         x8+A==
X-Forwarded-Encrypted: i=1; AJvYcCWo/F2NnbYu9x9WqNi6fqTkp2Pkgeg/3SBGnikKyWC+d8Nn52WkdxQn1vUJdfKkyXjtfkfwjB2jCq+d1rnz@lists.linux.dev
X-Gm-Message-State: AOJu0YxVGb13Q8vvU3BneEkaEatSaBT9jdbE6WQCe6DQMuSfg3sImvtX
	/sZQ4Jc1cibLc2x0DuG8f15Rh2Fn5z64PVbiLDdQKNrOhcJzJ8qnJmjU
X-Gm-Gg: ASbGnctVXPDcJi5jT1pABkVb009hWhUfIHwIL3phd8oQDy/kAVUK0cUmyC+jcAR0izr
	m3ytf7HJY/HXvX8flKb55+ntpZ8ozRPmeq/LZBXtG+GLVLJmMo5x4pNt/OuX9UsTYApDTFqfItt
	y7mSkvXKQg8/liZ9KrZTHHtsRfgLDroDNqyBA7QY0++DMUW59Go/cUstB6Wj7TK3LEzwvkMjKF3
	bcg/Mn25EbiRrWvkH8x6VUnQYhuR9bggi0pdJBmIL+/ySFoABOWSCaYTHCAmzapDx3km+1+ZNev
	ZLto/dR0WwhDnDG36C0yeuOqQNNM771jyfAyjAdt7gkcstw7D5Ix7NPu8JZ4JZSq5AzpX2N0Cfx
	yTa8Ts6N6fkGHqNXJkRQ+awsT/Xsah2VXEXM6zC3GCBRSDQ==
X-Google-Smtp-Source: AGHT+IEhqmIbQyxJ6MlVMW89fIF9FKRQ6pvNg918nxTQ3N6tEH4/HYPEQ8cRRp3G2v1dZiLXD1He0w==
X-Received: by 2002:a05:6a20:728d:b0:23d:c7aa:a6f0 with SMTP id adf61e73a8af0-243d6f39414mr14323450637.22.1756817110949;
        Tue, 02 Sep 2025 05:45:10 -0700 (PDT)
Received: from dragon (104.245.102.166.16clouds.com. [104.245.102.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f5a0bf9sm20057925a91.13.2025.09.02.05.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:45:10 -0700 (PDT)
Date: Tue, 2 Sep 2025 20:45:03 +0800
From: Shawn Guo <shawn.gsc@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Hans Verkuil <hverkuil@xs4all.nl>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [linux-next:master 4756/5291]
 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb:
 isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too
 short
Message-ID: <aLbmz--3Y2eKVuYN@dragon>
References: <202509021101.Bz8COtDw-lkp@intel.com>
 <20250902092012.GG13448@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902092012.GG13448@pendragon.ideasonboard.com>

On Tue, Sep 02, 2025 at 11:20:12AM +0200, Laurent Pinchart wrote:
> CC'ing Shawn.
> 
> On Tue, Sep 02, 2025 at 11:33:28AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   33bcf93b9a6b028758105680f8b538a31bc563cf
> > commit: acfaba169385bfa243a10a027f8272a974b2288a [4756/5291] dt-bindings: media: rkisp1: Require pclk clock on i.MX8MP variant
> > config: arm64-randconfig-052-20250831 (https://download.01.org/0day-ci/archive/20250902/202509021101.Bz8COtDw-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac23f7465eedd0dd565ffb201f573e7a69695fa3)
> > dtschema version: 2025.6.2.dev4+g8f79ddd
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021101.Bz8COtDw-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202509021101.Bz8COtDw-lkp@intel.com/
> 
> This is fixed by https://lore.kernel.org/all/20250616011115.19515-7-laurent.pinchart@ideasonboard.com/
> 
> Shawn, could you merge that one quickly if possible ?

Done.  Sorry for the delay!

Shawn
