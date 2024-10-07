Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCA31DC046
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 18:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728324239; cv=none; b=fV2fTaAx88z71F8rD+CctYY73vICg1HbntxoWEfyIYWZv2b5f87Jte3lKhK7vyUPJikRD16J2pUpucT1+yB9UK3BmmO1wy2OhQqNqBjtxfsH0eoi6cfFOuo7ct8dfTKKG93LMDKLgiPKIyDYiTML5bge9b4Giw7NhYNvD81WgxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728324239; c=relaxed/simple;
	bh=I22d/+GHsIHGfgt+4eFMnOhieCI52FZK/3/kffHd95E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWfWCVXnIgXnpwUci7I1qL2S4DIBI6oOQREwpEpeDoBZv6KuRHHrY02Sk2Id2SDnDh6FWP20ET6xZsLQcC7bDYJECskozrgWbLNiSrag9N9hgO9VxrupVHb4yfuxN8CmWYS9YyNlfKBiX0Z9YuDPnjQtASdubhYunmYBsEsyEuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=eN0iXVQz; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="eN0iXVQz"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71dfc78d6ddso1758809b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 07 Oct 2024 11:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728324236; x=1728929036; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MVGSjDknVMXjQYoTQZQyn6ion9DZQ87YWfmvoPAOAL8=;
        b=eN0iXVQz6yBbnNZa9YeDsrr3kqN/AL8u0xI0Rh3TmgZegKcGWw5x/cCv5Ov093c5AL
         O+MZtc/QutpZl0yVjxmc4z4A2JvljbO2TYumHCYVuN/M2wGlC/dWSR83ycO1EX6T70dW
         Jh0dT5hzBC1OKiqOi2Xzf8GnGMG6wg7yIlOoEmuGyowVEZ0+6HwrWCPgRHNTciqMbZhD
         OrjYcOjF5bK9H00Kfi2plkiK9CUUhO5vMRDqquWAwCYbc5tdhjnK3B77E1r1lMYt9fla
         evMuZZ5VrGiwvNXoKgKgawldZc3X1IaqTCDndk3QV7opJKSQJ8kyqeUcHRLILMQANIcO
         hnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728324236; x=1728929036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVGSjDknVMXjQYoTQZQyn6ion9DZQ87YWfmvoPAOAL8=;
        b=rwDR9FeLrSiwMHo5dcoRN05t5qlMBODyThaBWW9dULZsJMvSGFaTXRUcJN0d2TCKRF
         b1OKhYFoNSBS74pYT39eVo8+NGNlWTefAoprS9MN9VwSvTSGB8YRE5/PtV8q7yiAOd25
         fIbHITrVnBcyjrI/Ntgd4g6AUu6SXLzJYHYz7pfhbspd5gVQ/ZphuCx/6G/tIl6SemRX
         LB8swkR52L3xIhk9XdBplks2c8mTrnDAyE5EImMLy/GkajNAG3OW19omWcFSxFeOOWn7
         8JHPy8T1A2NFVgYAI/IllXjuGlf5gMNjgAMfmsCXJ+izi9yn5NdXt6v3/vA6zX8l0Bhy
         F14g==
X-Forwarded-Encrypted: i=1; AJvYcCX4Fx3/6+BkQdLV9ECcxM9mJW5fl71TltHkEZR9YvbHzsVoqkX/ml0PdXd8GK8F468CDfNar496op75yPWn@lists.linux.dev
X-Gm-Message-State: AOJu0YytxY+NoZDBP/ikk4oBf1vmKPFp0QmNkFRwBQuAVVoBvQFGmS0D
	SbHBCoLJZ1Dhxn949qX5atZ7riUs0wyte0b6F3PVxDrdIho1VDhScNihfVhkl5o=
X-Google-Smtp-Source: AGHT+IHtCkLsJksWiActtwWLrS0eD/m1ABPJG3RzxhSPeEyDzgju5CyXRLJOluQztqFFZN29rhif1Q==
X-Received: by 2002:a05:6a00:2d8c:b0:71e:b8:1930 with SMTP id d2e1a72fcca58-71e00b81b19mr9261207b3a.16.1728324236611;
        Mon, 07 Oct 2024 11:03:56 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d47edfsm4662653b3a.128.2024.10.07.11.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:03:56 -0700 (PDT)
Date: Mon, 7 Oct 2024 11:03:54 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: kernel test robot <lkp@intel.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
	oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] pinctrl: th1520: Convert dt child node loop to
 scoped iterator
Message-ID: <ZwQiijdDKDHvwcOx@x1>
References: <20241006-th1520-pinctrl-fixes-v2-3-b1822ae3a6d7@tenstorrent.com>
 <202410072033.XpRqZ8nz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410072033.XpRqZ8nz-lkp@intel.com>

On Mon, Oct 07, 2024 at 08:26:28PM +0800, kernel test robot wrote:
> Hi Drew,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 2694868880705e8f6bb61b24b1b25adc42a4a217]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/pinctrl-th1520-Fix-return-value-for-unknown-pin-error/20241007-014953
> base:   2694868880705e8f6bb61b24b1b25adc42a4a217
> patch link:    https://lore.kernel.org/r/20241006-th1520-pinctrl-fixes-v2-3-b1822ae3a6d7%40tenstorrent.com
> patch subject: [PATCH v2 3/3] pinctrl: th1520: Convert dt child node loop to scoped iterator
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241007/202410072033.XpRqZ8nz-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410072033.XpRqZ8nz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410072033.XpRqZ8nz-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/pinctrl/pinctrl-th1520.c: In function 'th1520_pinctrl_dt_node_to_map':
> >> drivers/pinctrl/pinctrl-th1520.c:420:29: warning: unused variable 'child' [-Wunused-variable]
>      420 |         struct device_node *child;
>          |                             ^~~~~

It seems this is because the scoped iterator declares *child in the
macro and thus no separate declaration is needed:

 #define for_each_available_child_of_node_scoped(parent, child) \
         for (struct device_node *child __free(device_node) =            \
              of_get_next_available_child(parent, NULL);                 \
              child != NULL;                                             \
              child = of_get_next_available_child(parent, child))

I'll fix in next revision.

Thanks,
Drew
