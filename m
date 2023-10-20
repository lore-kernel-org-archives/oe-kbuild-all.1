Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784A3D2EF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 07:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7I+Hd7e"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-584042e7f73so293573eaf.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 00:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697786764; x=1698391564; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFRNZAMpeB6E4zklJPzAHH2uci2x6x/wcyaYBVvHgCA=;
        b=M7I+Hd7eAgnqFRo9oshGVx9xcVB5WmS6gmhcL4OpWSTza1QEko3VUMXs4esvUL4VBu
         R3wyM4+7gwVjxA5y/Tf5GWeJOTNQUGawIrybaZRVT1rgvgRo64TCPer0r4ZkX8UFhWpZ
         K65K8Cac/X7m/QIr/RwjnaAodz+PXt2mkMBNTk1EpjcniqBYnON9y6Ot96wqoTiZtQry
         19s1OpXSYrzY6GQDLqHkBSgkm1Y/uuBXqxMP6IfGAbvfXnQeuj4yZiDXgxa/n3N7hai/
         8BsgFSITuhKXazmQ0/Gcgfcm+jZXEeXJ4KyzCNnql/dh0LzU8AT8AzHTAfZt7r9BDTj/
         IAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786764; x=1698391564;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFRNZAMpeB6E4zklJPzAHH2uci2x6x/wcyaYBVvHgCA=;
        b=QRgMlQxf0GprtU6ZVTiKqM4DApAokJz6yxyeFDFvYUGgEwwT41dSnJcfL6w/ArdJur
         qD0NjG26K7ahDfODpNhuGxwKYXmflmvpfoJVrMhTFVhjZXpEcb8Ey6fEBqufDxv/vZ/Q
         uJ5L533IXqQ2qGWUALwWyu710Cq+zCx0K5qFtP1TsXvFdJSIeKF4FN7n+nDUQcYqB+4R
         zB/BJMOzVrD6T/XjwXk/39fki7jxTKN8TcVW9zBVSC0vOO6mS9Z1oDd3vEUpe+PdlvoP
         kxEGeNGPkETJzEhs91oCQ+ZAIylpYpoWW4Ybig8aNiRlxZUVSRN4erORJIH81QQuH+wU
         M8tw==
X-Gm-Message-State: AOJu0Yzl167aWx87H2bXficw4POpHc5i+vaItPz9Wd/GrCpf0KRP8+KQ
	F1HM/ZGm13ce2M33FrOm25tAR5LXww/uzg==
X-Google-Smtp-Source: AGHT+IFT3iU+T4U4DGKBGbnCb4TOli86nCqWFGS4y8lW8RKlUjr5t/9R+N/LeL1pAmDDwPlqt+VYag==
X-Received: by 2002:a05:6358:278f:b0:168:b28c:3b7e with SMTP id l15-20020a056358278f00b00168b28c3b7emr1023718rwb.29.1697786764007;
        Fri, 20 Oct 2023 00:26:04 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id y15-20020aa79aef000000b0068883728c16sm904458pfp.144.2023.10.20.00.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:26:03 -0700 (PDT)
Date: Fri, 20 Oct 2023 00:26:02 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	julia.lawall@inria.fr, Andi Shyti <andi.shyti@kernel.org>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/5] staging: vme_user: Replace printk() with dev_*()
Message-ID: <20231020072602.GD27881@Negi>
References: <a36a0b839f9c21efe1f2df6f9272ae882fd04fb8.1697763267.git.soumya.negi97@gmail.com>
 <202310201236.d4IEfmLQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310201236.d4IEfmLQ-lkp@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Oct 20, 2023 at 01:09:26PM +0800, kernel test robot wrote:
> Hi Soumya,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on staging/staging-testing]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Soumya-Negi/staging-vme_user-Replace-printk-with-dev_/20231020-095619
> base:   staging/staging-testing
> patch link:    https://lore.kernel.org/r/a36a0b839f9c21efe1f2df6f9272ae882fd04fb8.1697763267.git.soumya.negi97%40gmail.com
> patch subject: [PATCH v3 1/5] staging: vme_user: Replace printk() with dev_*()
> reproduce: (https://download.01.org/0day-ci/archive/20231020/202310201236.d4IEfmLQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310201236.d4IEfmLQ-lkp@intel.com/
> 
> # many are suggestions rather than must-fix
> 
> WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_slave_get', this function's name, in a string
> #118: FILE: drivers/staging/vme_user/vme.c:425:
> +		dev_err(bridge->parent, "vme_slave_get not supported\n");
> 
> WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_master_set', this function's name, in a string
> #191: FILE: drivers/staging/vme_user/vme.c:577:
> +		dev_warn(bridge->parent, "vme_master_set not supported\n");
> 
> WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_set', this function's name, in a string
> #583: FILE: drivers/staging/vme_user/vme.c:1577:
> +		dev_err(bridge->parent, "vme_lm_set not supported\n");
> 
> WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_get', this function's name, in a string
> #600: FILE: drivers/staging/vme_user/vme.c:1613:
> +		dev_err(bridge->parent, "vme_lm_get not supported\n");
> 
> WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_attach', this function's name, in a string
> #617: FILE: drivers/staging/vme_user/vme.c:1650:
> +		dev_err(bridge->parent, "vme_lm_attach not supported\n");
> 
> WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_detach', this function's name, in a string
> #634: FILE: drivers/staging/vme_user/vme.c:1683:
> +		dev_err(bridge->parent, "vme_lm_detach not supported\n");
> 
> WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_slot_num', this function's name, in a string
> #662: FILE: drivers/staging/vme_user/vme.c:1751:
> +		dev_warn(bridge->parent, "vme_slot_num not supported\n");
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Hi,

There are changes being made in stages. This patch is replacing printk() to 
dev_err() while keeping the message string unchanged. The function names 
embedded are removed from the message strings by using __func__ in the next
patch of this patchset:

   "[PATCH v3 2/5] staging: vme_user: Use __func__ instead of function name"

And the warnings go away.

Should the tags suggested by this bot be added to [PATCH v3 2/5] in this
case?

Thanks,
Soumya
