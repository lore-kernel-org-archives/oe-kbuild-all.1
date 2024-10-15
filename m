Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3001E2821
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 09:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728986250; cv=none; b=HMzNwcygm0VoKoeFoewd3wUf5v2CGZ5Tmw+sWFBlwPD277obdefDf6EnpJlHzORyDUdyrS3yRZqWgwjsEhYWgrtLiQBqXMMnPZen5vDLNOBPgDJKsOWiyf90Qt16JM1B0NvKdy1vn/4PXt4+wINMZa15KRLS+fjr6A6skeTH5sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728986250; c=relaxed/simple;
	bh=Fts6/1RabYEbIy3v8+9FhvpEspO0TjKei/OAcyJOqr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QOqzKR6G6QBe8i+rQLo7qECtR1uh1gkMQ5sg6SotSkbd8oBojhvmVeGR9vIyfbRwcnE8eqljq6NyxweLW8F5p5zBmDjTTM1PTDq4Gr/cuc4xlsjMljwr3h1/au0uhU5Kmp6jOvKuCmf+Lrfm78pVBrm6klWPJfQHeEPIyoJvqME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GL5rx8rG; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GL5rx8rG"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c97cc83832so2370203a12.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 02:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728986245; x=1729591045; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pfd9Ji8+CtIaiWyzsdO/tzYifkcmo2104Us2nW9BUHs=;
        b=GL5rx8rGPFXs8OuyP4qW/QnclX/8bghXZ/2Xjfs2nNh1Bou2UwTj/TXRjJ+FHXHTnY
         bKCDfvnLAR2ChUzHfQ7mY9iRi9FtJjFSbS/tXNK0riJvzSJjGfUYiKufELlI6XWHSEjy
         hIRTFV91PPQ4dPK+BwgDzIo0PQFZTTdORZA+WxZdjQ//hTdG42YGiEgNtRGSkkC7mhLF
         zdelakGsglyAtdtq1AptZTgXTPoCas4xA2cwWoDIMo5pcUi1meAh69KoYT53q3phYRuR
         GztKO7P82IrnOn1Y4MbXkGyrscU+t5OBt11/wI0s1ZeLqJs3dA2UJTfm9EU6oEVHxUwV
         rViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728986245; x=1729591045;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pfd9Ji8+CtIaiWyzsdO/tzYifkcmo2104Us2nW9BUHs=;
        b=cAWISCB9bZzXt+MVT1GMr5DWBRw4SMC7KVILJ+geZTlh4mRk4b7ZYm7ewYAYiWOA1X
         8x5yzCnUZnvcdybrQUHPChqzVgTpvLiek6mPsWZvx94HxxF3URLaXSvE2RrlTwF+8KT3
         SOJQYjDbZsGVLC9W3clkULqSt3xu6qDThf1Rvr+Tok8FTtIGsLNp1KLrYPnCkwUuY2Cu
         zZOvwdSQF9GwfQ448YES3PS3lwdNmLTuzdP+BC8pAD7cwRdVD6DoCMd8C80tlgoTi+4w
         eIl6MIwMQYFmp7UtSM6/k+7hAUeXMu+ACC7gYUMfPT1brNSPZbvPj947KuzX62AauE6x
         PiKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwGL+/ZxBWEOQtcWzx5lC0UbrsiA7+aWlpUss8rmJOOiCWCNqDQPVeTh07FZp6FGI3Hc87XA9SzUV3wO1q@lists.linux.dev
X-Gm-Message-State: AOJu0YySUHJET9bUoMTnBSzn7F5a4NAElNF3ODzWcti+eBo47bXf/Vwh
	vJnHT6gS8eHqZ9aqS3EfKsc761zQBguV3EsYCXzhKk0UQeBcb6/CmIIRmUknCOI=
X-Google-Smtp-Source: AGHT+IE/1hZx31jarMp7okmy+T78/Ax8AzJsjAdAGu3NJyFhcpkNjwkbPfAQFJPWV+XmxTiFfR5RNQ==
X-Received: by 2002:a50:c90d:0:b0:5c9:3275:1ac5 with SMTP id 4fb4d7f45d1cf-5c948cd95d3mr8312547a12.20.1728986245095;
        Tue, 15 Oct 2024 02:57:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d4d6297sm506909a12.15.2024.10.15.02.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 02:57:24 -0700 (PDT)
Date: Tue, 15 Oct 2024 12:57:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 3/3] pinctrl: th1520: Factor out casts
Message-ID: <1379102f-6de8-4346-9c42-af49dcfaea2e@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011144826.381104-4-emil.renner.berthing@canonical.com>

Hi Emil,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Emil-Renner-Berthing/pinctrl-th1520-Fix-pinconf-return-values/20241011-224939
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241011144826.381104-4-emil.renner.berthing%40canonical.com
patch subject: [PATCH v1 3/3] pinctrl: th1520: Factor out casts
config: csky-randconfig-r073-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151731.MnWrd9PX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410151731.MnWrd9PX-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinctrl-th1520.c:808 th1520_pinmux_set_mux() warn: variable dereferenced before check 'func' (see line 806)

vim +/func +808 drivers/pinctrl/pinctrl-th1520.c

bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  801  static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  802  				 unsigned int fsel, unsigned int gsel)
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  803  {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  804  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  805  	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
3d7cbbc97d4a47 Emil Renner Berthing 2024-10-11 @806  	enum th1520_muxtype muxtype = (uintptr_t)func->data;
                                                                                                 ^^^^^^^^^^
Dereference

bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  807  
d01240b22abf28 clingfei             2024-10-03 @808  	if (!func)
                                                             ^^^^
Checked too late

d01240b22abf28 clingfei             2024-10-03  809  		return -EINVAL;
3d7cbbc97d4a47 Emil Renner Berthing 2024-10-11  810  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  811  	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
3d7cbbc97d4a47 Emil Renner Berthing 2024-10-11  812  				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
3d7cbbc97d4a47 Emil Renner Berthing 2024-10-11  813  				 muxtype);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  814  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

