Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8F83D904F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069741; cv=none; b=RXbQ+x7jVrPDWi4pZIUKEzjWHOxssjc0NLW9oG7An5mpoYCEIPZCrY8ONPp8FXCq8rpNMTzr/8HoV9H/l7VcyJSJBTzfpY5EVMhrJgNYzxXpRRMreJEg92CrvYraPO9Z3DS9KtSjg91hW145lNsTn4KSait6+RQNykXDsh9jiFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069741; c=relaxed/simple;
	bh=C14M0/MHvdlnreJuXJ0isfK5S/BUhD9EzbbiL+RZRMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bf1z46EYSAPM8w3k4mlaKWU43oGTYVtjVaXYmoA2wNnWVRJElOLz5y3rp2QVHmSU+V00f4LRUf6GvZ9VEe6AI/DaNaizpByVwvJhcIRmY7x3fD+N5kiYh7dp88lfi+iD5u0TAyMXYWrIZq5TiMEy5D4/T/bTXXY7+hbf3d2v9wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlebdO5T; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlebdO5T"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-506aa685d62so65083511cf.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 09 Mar 2026 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773069739; x=1773674539; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oJ0IFQkTsvRxT5kR7bBZ8R12e5L9cMhcIel8ANwAQDA=;
        b=FlebdO5TZXLa2avlVQ4WIhN3AI6eTkGzUIiR6IXNa+AiCPNQqs/+bxP4UxCO+8YfQE
         RnQ438pKxYL+BR9f2lbSp/vFMMy6Q8us5dFHHbxX7tOgNPKr5GfbrmJNRrl3ANb/kf/2
         HtwVmVDMii9CWujH0kyXUHgZya1DbM9v+rkhqQ+b8OAFj98uUtAWcRrKgy/AJgwYNjk6
         cyxHvHpRarkf/BFFxaly25QlWhZQrm+L3giPG/T15IByGHEqzPjJSCvhpW3pdV4ULfwK
         2WvZVfPi2hi3NgONPfxd092dnT1A7/h3T0sf5c+sH0Vy0UbhVnc0kBhchbO44gdNsz9M
         AZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069739; x=1773674539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJ0IFQkTsvRxT5kR7bBZ8R12e5L9cMhcIel8ANwAQDA=;
        b=mZ6w4iBrsCjNQdxsJW+G98ow/Su1924B4yaPTW4V+ad/HjAKkNsLFn/J4DU/63eZZM
         I7kTC77PLdAIS8Ho+jkxEfNQ1WWggz+8YVJn8SyZJsd8nS/sAMdJe5HwUOG/JqwP4ewg
         2AZWzshH/DwS9+6rhQ0TMJbWp3A69shcMWVeiUHXxhKbS5sFZbz4U+quARnvddS3xvUD
         wu48tWI/dV4hCExH52rX9mXC88XBScv9If7vxiLYbUm6CMNV2mvjUvbo4Eb2or8DS6H+
         DRRcDlx/ymaRdeQy9jChCzrRSZV4C8bt6JaxqnrWC42JsSqwCfYvdUudh9PBxqpUdsqb
         Yn7g==
X-Forwarded-Encrypted: i=1; AJvYcCU7veC6r/LEQ6C5VZSg93KLzLsQ8hLyKKp3lslJftTtxeKcMb3J2H9GaXG5Od3Rddw/KRLxpjUG2v4bGVfA@lists.linux.dev
X-Gm-Message-State: AOJu0YzCQqwCIAvuimO44dXGdLafVv5vsqnITYYZZF/HWzK2TKSk9A5A
	N3a7qv6LyDUcni4kQFZ56r6Bg5XYrs1UYGtDxrniAlxL9CQ80Hzm+PTx
X-Gm-Gg: ATEYQzxlxEvPvrwb3pn1k4hguac61WQrhAio2y+myra08RuVcHSU7uv0i7bgrvCaSHQ
	kY0q3R1gzs+AEtfrOlkj1dwfwiJVgGa0vsC0wQl0xGbgce8aJ4R+ufX1Nn7O8SAXcLMGQJvR+QC
	swpD8c07Z7ajmsbobxss7DcRT2I+8p0eorJ29y9SNRRqRuc12afOUZwO9Qt7F8A9+Rr6YOPT3Ua
	Hq8y4MNUIs9yBoOS3xGflcsrbETxV8RC9jQaJQAyGp1pAQr0upGbwud/JAerMiAzCeZ04a5gUcm
	w6pZTgffUucVCeSalMk6GJYQBLUJM4zxE8K+Go/EAKriNA1/HQ2bFikqIeklJm2LKOzIj6uddao
	K03MHm01saWUmRIQXUufOcD1ztk3YanXriZUNIiFP2ialZKRhBnsg/ZCa1tyC0R3ugKdviOKcqr
	qDwPPhXDQ+lU7H1XF0QI3nmsgoLH5hlCRMpaUf7e13UQCcrHenUg26TmRKj90=
X-Received: by 2002:ac8:5f89:0:b0:4e8:96ed:2e65 with SMTP id d75a77b69052e-508f470da7amr151657081cf.22.1773069738603;
        Mon, 09 Mar 2026 08:22:18 -0700 (PDT)
Received: from glsmbp.wifi.local.cmu.edu (cmu-device2.nat.cmu.net. [128.2.149.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5091a371f4dsm23634001cf.10.2026.03.09.08.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:22:18 -0700 (PDT)
Date: Mon, 9 Mar 2026 11:22:15 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Robert Winkler <rwinkler@antmicro.com>, oe-kbuild-all@lists.linux.dev,
	Filip Kokosinski <fkokosinski@antmicro.com>
Subject: Re: [litex-hub:litex-rebase 13/16]
 drivers/gpu/drm/litevideo/litevideo.c:290:3-8: No need to set .owner here.
 The core will do it.
Message-ID: <aa7lpxB_64IvCHud@glsmbp.wifi.local.cmu.edu>
References: <202603092134.JCkShZD1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603092134.JCkShZD1-lkp@intel.com>
X-Clacks-Overhead: GNU Terry Pratchett

Thanks for the report! I added a (temporary) commit containing the
fix to the github.com/litex-hub/linux.git tree (`litex-rebase` branch),
with the intention of eventually squashing it into the out-of-tree driver.

Thanks again,
--Gabriel

On Mon, Mar 09, 2026 at 09:16:35PM +0800, kernel test robot wrote:
> tree:   https://github.com/litex-hub/linux litex-rebase
> head:   70b59031ec17b4e6041cebf8534ecd29da9f7bd0
> commit: 1b116054c9d34fb08547d39e522d0d4b4b89c39d [13/16] LiteX: driver for LiteVideo
> config: sh-randconfig-r061-20260309 (https://download.01.org/0day-ci/archive/20260309/202603092134.JCkShZD1-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 15.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603092134.JCkShZD1-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
> >> drivers/gpu/drm/litevideo/litevideo.c:290:3-8: No need to set .owner here. The core will do it.
> 
> vim +290 drivers/gpu/drm/litevideo/litevideo.c
> 
>    285	
>    286	static struct platform_driver litevideo_platform_driver = {
>    287		.probe = litevideo_probe,
>    288		.driver = {
>    289			.name = DRIVER_NAME,
>  > 290			.owner = THIS_MODULE,
>    291			.of_match_table = litevideo_of_match,
>    292		},
>    293	};
>    294	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
