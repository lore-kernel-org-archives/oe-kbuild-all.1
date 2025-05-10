Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F44D1E25EF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 07:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863032; cv=none; b=U4m/0NxikbVyWLP2tssqGx3rVWKm4hqVVxsx8SBo1hp0DDZ1G0OILiY2jk24ohyUbY+mczkVW0xClMtqI1e6E1bxauZFuEtD45ZQMvcay7/FdD/uOjeZTIXy66+3B9PhqeMZag9+W9VWPM4u63ze46hoyMwifda/jW/fEf+uBk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863032; c=relaxed/simple;
	bh=gVwu5i5dr8Gu8f8RQwH56pS50hW/bWmE75LzhrJPSX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GCutYISS4GUBRaDq9myUvHtaOjr7RW9ECzYkk49X2TQFsaQFq9ewip5kZYk7eHpDK4MepnlaA2+XtcsEWu+Z8AQ1rsPT3YHSV6mWH3C8bA+f5sw6PKMtvNS86bt0/VxXemFcllad3flSk+rse/qIXg988CmXIfmyb86+UU4+Kbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RMo+D7vj; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RMo+D7vj"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a1b8e8b2b2so1256346f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 00:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746863028; x=1747467828; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zgxyHav/FDfAPqF2ubFj/kOjw60kxGTa94/J4F6aQhQ=;
        b=RMo+D7vjgGoPNckz5Mr/Pv89Urgfzw739KKo1eHecN/rHPcLBp1nPNvzCfqA9Gilcg
         0PnD7wGlp2UAXrmkfiRVxcGuJLojpQa8ctYGHlKfEeBcyElqif8lK7nP6Z2fwR3mjqP8
         /uP98f39SjkrOTg12uw5PXSfJy6khcqt6ZOnny025sL9PKSQUSTaDeJWP/AfnUp6xEMo
         epAMFmTph1HeQOQ41k7ELpebwbGqJpZQRXJSzhGTizQskGckQBKVG6Z9GiALp/iwOu+v
         zJvvGem+nzAuoTGK9uTDBIxFnaznQPN8/lssmP1XT2xN7MDAt+rNdhckIT+JQqxRA+85
         rdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746863028; x=1747467828;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgxyHav/FDfAPqF2ubFj/kOjw60kxGTa94/J4F6aQhQ=;
        b=CJhIvm2ASeD1p7ZzWHcYSpljaum2RphjON/1J/Vz+bzSNV68y2MEVpCQPUutRi3o2j
         pNHWnMP1Sf9KlB/IBz5dHoeXljOf5i3zShbeNh3kqnJWKat7jq8P+mwRsatjK7UJdHcd
         6dg4tabgxPhJdxdJikYXAWrGV9zbhNXHW4/TsYrnCcGrsDyh47fdW4cNH8d6eqvM4y1i
         oNcYwJg4nJFWCMgOWl8svHk2ZIYDAgI5gpQ6vira6bBcKFERnL02xTYd1wJcIvOSj3T3
         Kifun3avq3yzU4Y2jHFIja1s3wVF9g5OCCuOURrx+pVSQCK00Vxvnqn6YFNLpfCoi6nr
         Dbzw==
X-Forwarded-Encrypted: i=1; AJvYcCXlk75tE5+lxqlo3pq6jhhhk0/a1kQnd3SUctBLbvT4B0N92BdBjNMR8i4OnIHWwEOgmGh6QCq4WqY/dOUy@lists.linux.dev
X-Gm-Message-State: AOJu0YyZYuyHEjR9UCKmUCVC/VoaxuWceKLLRbZ+AGccHt5LrcFQqsp+
	/m9n+n2L0oM0XqhtGOyFL0kDpE3Nf0OHg4MNEU1YikIx+fJkHsGG+IWHg0NrmV4=
X-Gm-Gg: ASbGncsBmOZVkWVQ3Xv2OtE7mNhEoLcjdRTt4BsFAlY0LWRAMzY9moP59NP/WzBmRDT
	uP2V2n3Ib+rDs34FUeiz8UmDAVLU69ciKQvoQKAfqYFwEwnKK7SCPw/ZKEL//cP9HEIJOvEP8SU
	b1D8JRU0fu/52m9EWf/t3wvGef3pXuIbiH1jv36paTAtPSVMYImeaZXLRYghn344BZ8tx9PxD+F
	qMhZt0i/un1qHREavTRsvDhzi8S0F6p9gcdI9i9D4zXW8bu9OCpJoey+4eDoX6buqGdRH/MDIro
	AiBNoI7jv4030RgRI968Pz9xjS/xG4QNQ9VVu9b9qLijNVcBXi502mxD
X-Google-Smtp-Source: AGHT+IEYxL7W6rw3MZmtN8Hifi8g47H7dZD22sCgXBrSPKpmdOCfDEnqQwAFYZ9z9qgI8K5Jh9yNrQ==
X-Received: by 2002:a05:6000:186e:b0:39d:724f:a8f1 with SMTP id ffacd0b85a97d-3a1f64279e0mr5124295f8f.10.1746863028389;
        Sat, 10 May 2025 00:43:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f57ddd2dsm5596666f8f.9.2025.05.10.00.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 00:43:48 -0700 (PDT)
Date: Sat, 10 May 2025 10:43:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: [tip:x86/boot 10/10] arch/x86/boot/compressed/sev-handle-vc.c:104
 do_boot_stage2_vc() error: we previously assumed 'boot_ghcb' could be null
 (see line 101)
Message-ID: <202505100719.9pE7wDfB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ard,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
head:   ed4d95d033e359f9445e85bf5a768a5859a5830b
commit: ed4d95d033e359f9445e85bf5a768a5859a5830b [10/10] x86/sev: Disentangle #VC handling code from startup code
config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100719.9pE7wDfB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505100719.9pE7wDfB-lkp@intel.com/

smatch warnings:
arch/x86/boot/compressed/sev-handle-vc.c:104 do_boot_stage2_vc() error: we previously assumed 'boot_ghcb' could be null (see line 101)

vim +/boot_ghcb +104 arch/x86/boot/compressed/sev-handle-vc.c

ed4d95d033e359 Ard Biesheuvel 2025-05-04   96  void do_boot_stage2_vc(struct pt_regs *regs, unsigned long exit_code)
ed4d95d033e359 Ard Biesheuvel 2025-05-04   97  {
ed4d95d033e359 Ard Biesheuvel 2025-05-04   98  	struct es_em_ctxt ctxt;
ed4d95d033e359 Ard Biesheuvel 2025-05-04   99  	enum es_result result;
ed4d95d033e359 Ard Biesheuvel 2025-05-04  100  
ed4d95d033e359 Ard Biesheuvel 2025-05-04 @101  	if (!boot_ghcb && !early_setup_ghcb())
                                                    ^^^^^^^^^^
Check for NULL.  Should the && be ||?

ed4d95d033e359 Ard Biesheuvel 2025-05-04  102  		sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SEV_ES_GEN_REQ);
ed4d95d033e359 Ard Biesheuvel 2025-05-04  103  
ed4d95d033e359 Ard Biesheuvel 2025-05-04 @104  	vc_ghcb_invalidate(boot_ghcb);
                                                                   ^^^^^^^^^
Unchecked dereference.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

