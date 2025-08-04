Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6412126BF7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 06:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754288525; cv=none; b=NEC30AGjH/Of9g5ilwgY33II/a5zFvlLV1OyHwv2a0llxMIJGmTS/yG5D+U5jTRcwujEdZltitH44GfcYhQ81Um3rqYoyoVZNQCK51Co3NzIVgP/nWRR12quK+pS8SPzvOr8Bj4o9miKI8JEAZjreC3KrTVM/zpXRjNOBkcVLno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754288525; c=relaxed/simple;
	bh=ZVTBW5jom+wDo14xqU/nVDagKZZ7c7CrXYvPIvLZROc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=auLH5nHyM1nFcXgBoxJiGMcJ9O9PS8US+kB3NGTNQ2Twp69ukq6z2qCmGDg16zTJWDucEwlER/jryeF+F71L1/DTU3I6MFAGQii7Vyg1OTztSEKRTHu/vi15+6oTRqOvJnVRhUpupShmuxyDfYRwcxqG6wrr5slQ9+1dozG2n5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fFkp5aI3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fFkp5aI3"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so25990355e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Aug 2025 23:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754288521; x=1754893321; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YeEcVaPruyFJjHGwTwns3V0T483/MZqGWdfOA8z6Bjg=;
        b=fFkp5aI3vYY+IkcoVGs+PRj3L3XlBCQF8oGepwwfjyzUrGhF3ntS3J5wGfR5AbXIEx
         V+YeUD3jsRtmQN0u88/9jw48CHS8Qfn3LHDecbIOBl5+A669viJTXHfHJsKGbTXIPO9Q
         Adled6YS38tqq5vzWrx2Et4oEu8uNrWjxVCjMKGPG0BCUEpOv0JUh2u25WoSxFIbua3+
         obcK4WYTH2IIp7b8A/KnK5JypurE7WY4c+f5HRep041WG7tXGmT8Ea0foX0KZ1Yby9fZ
         fYKyUvRBOnkqk6iFdYmNlKAsmXTruxrFVH6s59UCKVTnNKtBuYPbjrPb09Vo37ywrKlT
         uklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754288521; x=1754893321;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YeEcVaPruyFJjHGwTwns3V0T483/MZqGWdfOA8z6Bjg=;
        b=HOUh0BdCBA3cD5EkAO8h8/14NuvOnqKoCVvfxpcILjfHmIIZaGdR1n490f2oc2JQiv
         fBygofrh7J8+y2/aaJza41FXhUYOjHyiH9kBRrOdtnGXNE95Bnb9Vx82DccrQm/jAM82
         zVcOy4jXWsdOzLl1On0nJCxuthKbF/GilyNLl6MV0YNNdza5zcmgPx+MbbPKgFgjLvbv
         zKLdjkVNJDWWLCxu5L2Tg6iTPUg/rjxPCVl84uppS6xpSoIgUGCNohM2nB7/OBe0XxNP
         7JoNG2OeAF31d9K6cbevm51rchYdzznwcqMkESwJYEs10KxS0MCXqiYO4ZHuz1NrVZUN
         jiog==
X-Forwarded-Encrypted: i=1; AJvYcCXplOL1RKpoOV4NPb8WOWadYwoY/wIN2C784N34WU6GIcl2uieWXyeQkwAyeEFDnZ60+857S9ndUVq4QbPJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzBJGFil/SN7KmYbN2HgHjx8d+8D5xHg3xSYmZNodC7beJGn+ok
	/M/Tp19RVwt6A+92yGxHS0HKfBiJTXrxiLtfb9z7vPIp78v3L726baeFZxkJxRjWyec=
X-Gm-Gg: ASbGncsDLmTZc2lLcJC+lENOSDBVApTc3ikdPZ0apOdnHTXcLLA1OQhtVvCbo0kp+7c
	GFaDlowoTPZCfjhDHo2dUIN3p3+uXtVFahRTDG8W7UIjeEjz4YFDJ8zha+hHbvK+bwFt+KncGW6
	Sopu/y1Sp9M+iyCwzDcwsOjHSLHOz7+o3oJrlae48mfGMylXd5p62XesdS1TzLXDLVzd5SQlzos
	NyQRWGcpS/85CI/PTqfoNT52nRsgCCDC+xYB8Aky+PmN327RyIQd6TaRsunYp6hEqm68v28gso/
	fZtTQbaiWwABXDx8aM7kBQHQpbaDFS7Dyed+NPerFqiEmUy1MF9SenNmLGN3rdC/mkdTYnJrgO/
	H0mE0h1PHPlqCwIN5IQCi7nX7jEc=
X-Google-Smtp-Source: AGHT+IH2T/8BuRm1IuYQ8ZzUxeJrK/gX8hiqAWQjPLCDcfQbPMq9lk1U66LzhxKbxgNFFI75QhHvNg==
X-Received: by 2002:a05:600c:4692:b0:456:133f:a02d with SMTP id 5b1f17b1804b1-458b6b312d9mr64383135e9.17.1754288520939;
        Sun, 03 Aug 2025 23:22:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459db3048bdsm21955145e9.29.2025.08.03.23.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 23:22:00 -0700 (PDT)
Date: Mon, 4 Aug 2025 09:21:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Roberto Sassu <roberto.sassu@huawei.com>
Subject: Re: [PATCH v2 3/3] bpf: eliminate the allocation of an intermediate
 struct bpf_key
Message-ID: <df5a917b-fa24-42b7-8d71-b70e5156528e@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730172745.8480-4-James.Bottomley@HansenPartnership.com>

Hi James,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Bottomley/bpf-make-bpf_key-an-opaque-type/20250731-013040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250730172745.8480-4-James.Bottomley%40HansenPartnership.com
patch subject: [PATCH v2 3/3] bpf: eliminate the allocation of an intermediate struct bpf_key
config: i386-randconfig-141-20250803 (https://download.01.org/0day-ci/archive/20250804/202508040803.nwExqJWe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508040803.nwExqJWe-lkp@intel.com/

smatch warnings:
kernel/trace/bpf_trace.c:1364 bpf_verify_pkcs7_signature() warn: impossible condition '(key == BUILTIN_KEY) => (0-u32max == u64max)'

vim +1364 kernel/trace/bpf_trace.c

cce4c40b960673 Daniel Xu       2024-06-12  1353  __bpf_kfunc int bpf_verify_pkcs7_signature(struct bpf_dynptr *data_p,
cce4c40b960673 Daniel Xu       2024-06-12  1354  			       struct bpf_dynptr *sig_p,
865b0566d8f1a0 Roberto Sassu   2022-09-20  1355  			       struct bpf_key *trusted_keyring)
865b0566d8f1a0 Roberto Sassu   2022-09-20  1356  {
cce4c40b960673 Daniel Xu       2024-06-12  1357  	struct bpf_dynptr_kern *data_ptr = (struct bpf_dynptr_kern *)data_p;
cce4c40b960673 Daniel Xu       2024-06-12  1358  	struct bpf_dynptr_kern *sig_ptr = (struct bpf_dynptr_kern *)sig_p;
9cc2aa8d6b5c93 James Bottomley 2025-07-30  1359  	struct key *key = (struct key *)trusted_keyring;
74523c06ae20b8 Song Liu        2023-11-06  1360  	const void *data, *sig;
74523c06ae20b8 Song Liu        2023-11-06  1361  	u32 data_len, sig_len;
865b0566d8f1a0 Roberto Sassu   2022-09-20  1362  	int ret;
865b0566d8f1a0 Roberto Sassu   2022-09-20  1363  
9cc2aa8d6b5c93 James Bottomley 2025-07-30 @1364  	if ((unsigned long)key == BUILTIN_KEY)

BUILTIN_KEY should be changed to -1L so that this works on 32bit
systems.

9cc2aa8d6b5c93 James Bottomley 2025-07-30  1365  		key = NULL;
9cc2aa8d6b5c93 James Bottomley 2025-07-30  1366  
9cc2aa8d6b5c93 James Bottomley 2025-07-30  1367  	if (system_keyring_id_check((unsigned long)key) < 0) {
865b0566d8f1a0 Roberto Sassu   2022-09-20  1368  		/*
865b0566d8f1a0 Roberto Sassu   2022-09-20  1369  		 * Do the permission check deferred in bpf_lookup_user_key().
865b0566d8f1a0 Roberto Sassu   2022-09-20  1370  		 * See bpf_lookup_user_key() for more details.
865b0566d8f1a0 Roberto Sassu   2022-09-20  1371  		 *
865b0566d8f1a0 Roberto Sassu   2022-09-20  1372  		 * A call to key_task_permission() here would be redundant, as
865b0566d8f1a0 Roberto Sassu   2022-09-20  1373  		 * it is already done by keyring_search() called by
865b0566d8f1a0 Roberto Sassu   2022-09-20  1374  		 * find_asymmetric_key().
865b0566d8f1a0 Roberto Sassu   2022-09-20  1375  		 */
9cc2aa8d6b5c93 James Bottomley 2025-07-30  1376  		ret = key_validate(key);
865b0566d8f1a0 Roberto Sassu   2022-09-20  1377  		if (ret < 0)
865b0566d8f1a0 Roberto Sassu   2022-09-20  1378  			return ret;
865b0566d8f1a0 Roberto Sassu   2022-09-20  1379  	}
865b0566d8f1a0 Roberto Sassu   2022-09-20  1380  
74523c06ae20b8 Song Liu        2023-11-06  1381  	data_len = __bpf_dynptr_size(data_ptr);
74523c06ae20b8 Song Liu        2023-11-06  1382  	data = __bpf_dynptr_data(data_ptr, data_len);
74523c06ae20b8 Song Liu        2023-11-06  1383  	sig_len = __bpf_dynptr_size(sig_ptr);
74523c06ae20b8 Song Liu        2023-11-06  1384  	sig = __bpf_dynptr_data(sig_ptr, sig_len);
74523c06ae20b8 Song Liu        2023-11-06  1385  
9cc2aa8d6b5c93 James Bottomley 2025-07-30  1386  	return verify_pkcs7_signature(data, data_len, sig, sig_len, key,
865b0566d8f1a0 Roberto Sassu   2022-09-20  1387  				      VERIFYING_UNSPECIFIED_SIGNATURE, NULL,
865b0566d8f1a0 Roberto Sassu   2022-09-20  1388  				      NULL);
865b0566d8f1a0 Roberto Sassu   2022-09-20  1389  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

