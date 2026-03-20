Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A57A35A39C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 08:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773995830; cv=none; b=XVHYTgU01GRcBHpd6q1cjSas11kMvNjA5af1vGeJmXAKwZclXuePE9ofRFVygQ4LPgn78zKnrLLvpaugEuyFhgV8An47VyE0Sl8C+XJCfsgdH+C2hBDkXF5JbwOY3M0wUlZAVT3FH43apK44W17Bv9S6xfdS/VFpml9uciUo7KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773995830; c=relaxed/simple;
	bh=aubSRWOk/G5nMShy731v1i3p/4qj70+D9lPp6TThzE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=fMBC4kaRbcv7jD1b08DhILw2LV1Jc5nPLiwI8m2upCuZ8C1zVBNe/GVV0fhub+FN2JY0OltlXdS5Bl9ez9mp1WFla8LdvXEJBWKlrN+BbqCIe4FcK+IszAwKjwuN3+WAtpsiImKHpw/QNPtwhrCwaVMlqN+uSo9jif0ddEsuD5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yh9yWe8k; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yh9yWe8k"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439d8df7620so1040013f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 01:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773995827; x=1774600627; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=751vzObume+CAZzdt7A8eq8P7pep03Yg0q+zRI38A24=;
        b=Yh9yWe8ki+htJPQK6u9OldwVo/DAFD6Qfx2Ve+lZbDej9bklF7kL+g+Y2Bd2jbPDY6
         TYSEItr40/iu9058xk9sQ3lljmb7zEhuH6s7EuXbXKR8nO4e9g9ZgFm2w+QdbVkExBv7
         1id3yHyTb/HcZ+95uvpH9SizZNwCxwEZQKug2tSFUSTmxxpfr7y/UrdWAEP0XCPOw2W2
         tqyH6hWAV4unwbiksrlgCZMpsCfB3wmllNrH0kiKP5Y37/GdaTdZ1CEJ9ElvoTwFrzha
         eshdQTFC7D+D/xuCQdNcqNx8vSEtD4V9lqZBrYwo82mekEDkYJc/CuflykfxDRjtmX1L
         qgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773995827; x=1774600627;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=751vzObume+CAZzdt7A8eq8P7pep03Yg0q+zRI38A24=;
        b=DpKOMQZpbBMjKydr3S+48Y9bVsgtEJFgc60oQZXLlrY6TgddA7kGtLDh+7g03gbbUB
         rBDLIbGACWOLcXBxbpMYicARLqgKjJF3iUSAE3rm+vzI/252rQwwsEEqeu+NI0JK89c8
         aVMSja4xvXzfvDWqXb3uSN+7t2jErrAx52lQDXAyqzrodCJ2NXDHZK/uPzyxOUSiDYw9
         3mPyOE4mXXgrI+Q4TorM4UG7bH3sXpAMkARGtYx59DI/gwwizhEM22i/3Qv4Zi/rt948
         FNqI6pdnfGzi4E5KiKCfH4eoWbaraia5j67DcT/jcwEmU5+tqtW05ilSGulxPfnzsNzH
         OZ5g==
X-Forwarded-Encrypted: i=1; AJvYcCVmiHlb9hgdFSVRhRHXKrStRgWejZ/uKRg31P1ilXcAwXaS3S3rP2Rm/gb5rVsLNMmi6uxlehrWczwS8zvP@lists.linux.dev
X-Gm-Message-State: AOJu0Yy86NH+TBX2HPN2hzEOK+jyhdA5zrct1QS9P+dLhqxRnqmP9R40
	T3ig/t8r5svJpJW39ANAHfBYQ7Fbc+3B4/dT2t97bZ8MprNR3ctwJcjinwwIlBJnqK8=
X-Gm-Gg: ATEYQzyXB0oNTu6wHERH6r2H7XNuq8commK5Nz9Ats6Ay/NzfBgDnGXmlOxSeKkkNev
	QU4k9XbveJgwsLrEhAK8c6jPzKk0I4wbmzxwXLyzlyCVLmQgHZYEEqHDKYo2YMegLJJzoRrDfqA
	NfJhcyrkWinjHPw5wFi9U8RbYpHfjDaVGLKkH3DC8oeUvd0p8sPsKkDp6HBbYSysXTabnDEBRyo
	9KUzYq7H+UzEY1Vlzk92cD8IiNjQ48UMe2p+YGpybLV9NGLOJ1J0SrdYExxxqnZZZReLk8Qb+Ny
	NhzZvcg+t1O2x9UWTf7G9U+My2hqMiaTu7geTVYZ7Jt4bwKOLg+yEY0DYzT/+Afaq2Tz0HjmeQG
	+/S4eicuaxo4A6xiG3vhFwn8jZTRNK2Ac5nzMCS3rvzhzqgQyx2VAb/bE50hKAZUsIr4l3mGBc6
	6I4zCjoCjvNrHQ4QteRLi1OukpBonF
X-Received: by 2002:a5d:5f53:0:b0:439:be04:13c4 with SMTP id ffacd0b85a97d-43b6423d85bmr3740008f8f.4.1773995827294;
        Fri, 20 Mar 2026 01:37:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703343sm4288450f8f.19.2026.03.20.01.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:37:06 -0700 (PDT)
Date: Fri, 20 Mar 2026 11:37:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Support struct btf_struct_meta via
 KF_IMPLICIT_ARGS
Message-ID: <202603200410.ZnghNupo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318223544.1789748-1-ihor.solodrai@linux.dev>

Hi Ihor,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Ihor-Solodrai/selftests-bpf-Update-kfuncs-using-btf_struct_meta-to-new-variants/20260319-070652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260318223544.1789748-1-ihor.solodrai%40linux.dev
patch subject: [PATCH bpf-next v2 1/2] bpf: Support struct btf_struct_meta via KF_IMPLICIT_ARGS
config: x86_64-randconfig-161-20260319 (https://download.01.org/0day-ci/archive/20260320/202603200410.ZnghNupo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603200410.ZnghNupo-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:12760 is_bpf_rbtree_add_kfunc() error: buffer overflow 'special_kfunc_list' 64 <= 64

vim +/special_kfunc_list +12760 kernel/bpf/verifier.c

3700d7c829341d Ihor Solodrai   2026-03-18  12758  static bool is_bpf_rbtree_add_kfunc(u32 func_id)
3700d7c829341d Ihor Solodrai   2026-03-18  12759  {
3700d7c829341d Ihor Solodrai   2026-03-18 @12760  	return func_id == special_kfunc_list[KF_bpf_rbtree_add] ||
                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Out of bounds. We need to make the special_kfunc_list[] bigger if we're
going to keep adding new special_kfunc_type values.

3700d7c829341d Ihor Solodrai   2026-03-18  12761  	       func_id == special_kfunc_list[KF_bpf_rbtree_add_impl];
3700d7c829341d Ihor Solodrai   2026-03-18  12762  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

