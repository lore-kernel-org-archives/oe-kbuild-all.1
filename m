Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6961015AF5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPvmRdW1"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5aaebfac4b0so3978400a12.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 02:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697707381; x=1698312181; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W3D87wYNhn8mfasWMJ06ecpXznUyE1EnEEzRYw9bvC0=;
        b=tPvmRdW1WzMkb0gJ89Rs6v58aKbH3zClF/UPAj8NjMVlbnYTR0R4TnO4bdJvrjMuM2
         DU87rDWi5OCVKZbCl4tNjNB4LnUhGOLrrw/16/XWvJS86cA8IQSB7FGM/j8bWQ5dsd8h
         P72mfjEa513xFhM0P2Uj9w+zGhmBaTL75MfMmRpZ/Y2WF11OMnyOxj+4nWUqEOLWasV/
         3CgAhdVIP1OCNAileODiwVGUxZXuBVGB9BoocmesESxuxH46fWU3qOpFa52dCS9PEO5r
         KO59JxZARPKqI8otFY+7V1p1WRH5I0iOerTIlP2N1Yly50EZMVhsYTIGsY9AFdW1VLi5
         hYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697707381; x=1698312181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3D87wYNhn8mfasWMJ06ecpXznUyE1EnEEzRYw9bvC0=;
        b=PuqH2x61aZPzq7aTv7cZ4W/yvM/b5X6BPeleMH3bv55JAwLz6tlerW5N6ZVCHk+ddJ
         jSsfh1HECyL2zaQfdjPZGW1D4C3NDZSjHSQsA+IizDR5w/uXMbdUT6iGKUb4FXfglO/L
         b56o/6QwDRThaw89ovvA2ovQf2jPXciFTIINmxyPW6vuguzAvkkEufSMON/xFopwU481
         eogshPsHmMOX0gx/fCDDiEyi2mxuSGHoW+IfehBG7iGdv17cZ3mscDv0mNf5sBrs9eZt
         3ICAVHSfMVO3POs/x3kvkpDbogKvNkBMWTQOh2CczVjjgNq8KIKRQVpA06P6SFw7mPjV
         sPfQ==
X-Gm-Message-State: AOJu0YxCM0RPqswmaK+j13JWkPBNeEVLG1yvKvM+j5yBAbcxoLN95Ibh
	W1zGv3q1dXDSCdMUPchS572lLQ==
X-Google-Smtp-Source: AGHT+IHXNOg+0lYzzGBirIUl3IXGaAZ7Ijlp+g7bUY5GltFdbpupmWvVMSL2tAbT26zteoYzGWKbAg==
X-Received: by 2002:a05:6a21:4842:b0:171:75ef:d636 with SMTP id au2-20020a056a21484200b0017175efd636mr1370705pzc.21.1697707380704;
        Thu, 19 Oct 2023 02:23:00 -0700 (PDT)
Received: from localhost ([122.172.80.14])
        by smtp.gmail.com with ESMTPSA id ku12-20020a17090b218c00b00268b439a0cbsm1170790pjb.23.2023.10.19.02.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 02:23:00 -0700 (PDT)
Date: Thu, 19 Oct 2023 14:52:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V2 2/2] xen: privcmd: Add support for ioeventfd
Message-ID: <20231019092258.c2cbwmmgffa33bro@vireshk-i7>
References: <6e43e092e35a56619b0a132e78fac01b68ded94a.1696500578.git.viresh.kumar@linaro.org>
 <202310191650.u6UgzG1F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310191650.u6UgzG1F-lkp@intel.com>

On 19-10-23, 16:49, kernel test robot wrote:
> Hi Viresh,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on xen-tip/linux-next]
> [also build test WARNING on linus/master v6.6-rc6]
> [cannot apply to next-20231018]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Viresh-Kumar/xen-privcmd-Add-support-for-ioeventfd/20231005-215814
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
> patch link:    https://lore.kernel.org/r/6e43e092e35a56619b0a132e78fac01b68ded94a.1696500578.git.viresh.kumar%40linaro.org
> patch subject: [PATCH V2 2/2] xen: privcmd: Add support for ioeventfd
> config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310191650.u6UgzG1F-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191650.u6UgzG1F-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310191650.u6UgzG1F-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/xen/privcmd.c: In function 'alloc_ioreq':
> >> drivers/xen/privcmd.c:1233:30: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
>     1233 |                 kioreq->ports[i].vcpu = i;

Looks like a false negative.

-- 
viresh
