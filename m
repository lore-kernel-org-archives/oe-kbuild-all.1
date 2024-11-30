Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9BB4436E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 16:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732982784; cv=none; b=CZOJMGxLi3HTWxsOypqiEmD9Gnreh4dr8ahmZPcf70WKVcH9BEqGf+5RCd1AjsiyWzrReHHd1P8kxrP0BKaouH62xKV3UCvJjMd10rVKMQ3HfyzML13aaeHBdxu354H7NXe+fcJ3RzSzFwqZJueeaQam1tLZhCVsBsFOf3CMMUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732982784; c=relaxed/simple;
	bh=Nsrnp7LaDtQNb9ASCOGm1PaoWaIYfsrJjazNvTHMLkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N3Nl4jaIUcwxR2+voS7QLAeG5ZxKgpqyTFb3ua9awCYqjEwnC+lfFoGcALSWqJENdyPHft/BpnSk3JnHsyD3kiHrHWwfanM7YaLorNv+5zayDOCsyniT7KZo35n2hdFuAUbqC7SV3dvA+LobCjyT/AObtd3qHYedcsdxTg10unk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kMFN4xQk; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kMFN4xQk"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa549f2fa32so419447366b.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 08:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732982780; x=1733587580; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CMYdxPyOmeFhFZ6H0csR+ykuJoEq6nooFSgO0tdXHGE=;
        b=kMFN4xQkYtiqAbwJKMBWhcrX4fT5o6iawNN6D9iC+J8UT5WtVLTn3p7Z0VMi1lPiYg
         vfzDZaNDkqg3FAbtjBMYBEREiAn8OG9QI3Y0cf2PzgHAKtxA7MzC/OzsR+prE3T8yfih
         nhYxdZ4g0KfRzD6LtZ1BeLeq6j6HiSV320Jcx9ogkjhz0utBSZXwlymX5Iigm0h4I6ei
         9cbbDIwzksikD9ZFhQMyN24fzW14Hef9JoGt34JbBXkyqhJou8Zbo+kYtMX2JD62welx
         lgC2NKWPE/rC45exGC7jiqO25lrdL/WKANUzO39koxTnCY8hNrSal3UObXdFgYjE4b2v
         aNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732982780; x=1733587580;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMYdxPyOmeFhFZ6H0csR+ykuJoEq6nooFSgO0tdXHGE=;
        b=QAJaJ9HIwDFELD9hQmaRuJZylrtx+b4eWPg26YpeyPwqlwbeolbrMfFiFRqmXTsTZQ
         6fsV3mhNvJSHxI+EAiKJW/SwRFln48WmAu2i4Bip52GvLdYal4rw536PhSOR1SsT9ldt
         IpHheCIG4AlkxCQPP3tlztofzSM1ku6lBUJIs0SaopPg/+czppgcuvJkrHR5cXt2XIln
         gKAPQPTMCP5g48ZElISDT+LyV1Ef7OPSHpWGGqWJzSwWO3rvwidMzbA8qj2xrp1MIds2
         NL4Tz+5RgADmyIM8qu2xOBTV7N+YsMKbuFmxkubCPpAN8rXjnSBRsj62ixaQaDabNmx1
         lo1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVX39Eda7BN32sHXcTPuzRqkRXgqSiRNJW5OQyTSHBHXojCYfEN7TNTvUyU8Jcbdjk+8SFo7FTPvYw6GfQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxW/RnVgdv3p57b8QGxdRFS1hW7PkiKkUzRewkQyoLaD1qjy1Q+
	Q7F7eTCwAMtNYSIqfd6SAQgQ9NG9Uw92cvB7jECM90vVV5VBTXmNxqWMbcTbKoLare8sfN4V/5H
	Y
X-Gm-Gg: ASbGncsLSmsY13Jm8XmvblgoJBYlnPdHHLXJIpvOTN/Z4KBK33p3CAfLpudqpAavb+O
	WFzJgApl0G4EsbkeHBEjnKFgH7BrP5Wv/VoruRrcwi61lGdnio3tH9LLYbHzrulTdA7vauxp2uC
	XC73KJcWlXfUjzL6QMBXKeSzi26mjIgNPvRtbdzXIdUH9ihkIjA5qhIaaA+pX/qvUxLLy//KvSG
	AsR5XH7GSKBRobW0TK0SulXddMwBGJRr0Uzc9mHbj9jVAtrZT+TypPyQgFVluFNhd+0nhWq
X-Google-Smtp-Source: AGHT+IH+QK21nXbKJawLHfjFBv+7+qZ9USZW54TK7dUsjTw7plIf6hEtUosiTwaCIdEMrlTGQwEdGQ==
X-Received: by 2002:a17:907:6ea9:b0:aa5:297a:429f with SMTP id a640c23a62f3a-aa58108036dmr1687028966b.51.1732982780279;
        Sat, 30 Nov 2024 08:06:20 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa599908be5sm292536066b.140.2024.11.30.08.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 08:06:19 -0800 (PST)
Date: Sat, 30 Nov 2024 19:06:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fsnotify_hsm 2/2] fs/binfmt_elf.c:1357 load_elf_binary()
 error: we previously assumed 'interpreter' could be null (see line 985)
Message-ID: <8704bdd6-74eb-41f3-86dd-2436315fdb4e@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fsnotify_hsm
head:   e155d521497c38f4ec41e56b154817f4854e7023
commit: 69f947e37830ee8307126700d082ff80d06d416a [2/2] fs: don't block write during exec on pre-content watched files
config: x86_64-randconfig-161-20241130 (https://download.01.org/0day-ci/archive/20241130/202411301243.AwR7XcXJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411301243.AwR7XcXJ-lkp@intel.com/

New smatch warnings:
fs/binfmt_elf.c:1357 load_elf_binary() error: we previously assumed 'interpreter' could be null (see line 985)
fs/binfmt_elf.c:1358 load_elf_binary() warn: variable dereferenced before check 'interpreter' (see line 1357)
fs/binfmt_elf.c:1358 load_elf_binary() warn: variable dereferenced before check 'interpreter' (see line 1357)

Old smatch warnings:
arch/x86/include/asm/elf.h:161 elf_common_init() warn: inconsistent indenting

vim +/interpreter +1357 fs/binfmt_elf.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  1345  
b83838313386f6 Kees Cook               2018-04-10  1346  	finalize_exec(bprm);
bc3d7bf61a9eae Gabriel Krisman Bertazi 2020-10-03  1347  	START_THREAD(elf_ex, regs, elf_entry, bprm->p);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1348  	retval = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1349  out:
^1da177e4c3f41 Linus Torvalds          2005-04-16  1350  	return retval;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1351  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1352  	/* error cleanup */
^1da177e4c3f41 Linus Torvalds          2005-04-16  1353  out_free_dentry:
0693ffebcfe5ac Alexey Dobriyan         2020-04-06  1354  	kfree(interp_elf_ex);
a9d9ef133f443a Paul Burton             2014-09-11  1355  	kfree(interp_elf_phdata);
594d2a14f2168c Li Zetao                2022-10-24  1356  out_free_file:
69f947e37830ee Amir Goldstein          2024-11-28 @1357  	exe_file_allow_write_access(interpreter);
                                                                                            ^^^^^^^^^^^
Unchecked dereference

^1da177e4c3f41 Linus Torvalds          2005-04-16 @1358  	if (interpreter)
                                                                    ^^^^^^^^^^^
Checked too late

^1da177e4c3f41 Linus Torvalds          2005-04-16  1359  		fput(interpreter);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1360  out_free_ph:
^1da177e4c3f41 Linus Torvalds          2005-04-16  1361  	kfree(elf_phdata);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1362  	goto out;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1363  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

