Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1AE218AC3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 11:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616170; cv=none; b=ZyO7OkLDXcb/JGgAub1vCrKKntrnJkLaXGX/4Sspt/bh9Oqg4goso/6HMkx0lTJduOjjf6tJhiYy+h82VMvNrdwdjWzcmN46cUV5N8kuyoX4x8TPmdPlUZ/ULRg4SKe0q00siLtJIh2pHDxYT5syclI/ujRhfuaAgyQQOj1pIBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616170; c=relaxed/simple;
	bh=Nsm1vmQ5RVdSbrB65LfCN0QcOKi1ecddboP9Z/mwL+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U3/i4pUnBVZxYK0pQXp9eyWj9Z1hiP/O4xAnre7w0H3CKk4Ik3VITgVB6xLJwws47G8YJkYd1uBRtEiFGqEiMo25V/KEmNRWBkNZVQbsOBVSi+l3WNkMorL6qDKqQ4+LoJGDy6mPZkHHqzFKI0ebDNTGI6Afz2OKkxim9+y7x8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T095e6B0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T095e6B0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so6162045e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 07 May 2025 04:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746616166; x=1747220966; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tNOrgb8F3WguaSLAy9hvHTDGrmuOUA/XHGwCNcsndV8=;
        b=T095e6B049r2UrgAjQyRasmHRa0iUd51Wv+p4KWqWSKdCapxTpApADhydztatm09AU
         4pTvMMxhT2CJN5zgdf5QVpCdxolpR3CakLzsFzEJw55NklEJR/KpCRoqsqr8uiOmxenG
         EUcwlsG3E6oSM2QTMpMPWLWGsjf9rmZMPbGm05mjHUiRW6iBbmk5cT5B1fiyEFiroKdI
         H5oNgIqJydL15b9ce3EHC8moQ4Fk90/o/yF6VxuCi8wi3pb1rYtYEjDpUuseM36pXBVb
         o10kgKv8ipMdsz3AjiZuI3CvmyN05MJm4BiFpVYLDHduGlRVSO8NC5N/pJjJCENorQF2
         w5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746616166; x=1747220966;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tNOrgb8F3WguaSLAy9hvHTDGrmuOUA/XHGwCNcsndV8=;
        b=h1HirfIaABwDhpiaoMrqcgZzIjg1NCrRkmDV4anL3zN+hAty8KMi5gWE/cCZVhWAis
         yrZcQOsJzL3+PJERtK3LZE40ILDjp+5oem4WXGjCNKMe+vtBXAzicyVV77o3W41C0odk
         0K6i8qGP7iLXeFAK2eL80fyn1JdCWPvfUCKPgf9cfX5rwV1dWe7m4uC/O797O+gd+oW5
         1lOSs+YCXINA+mS73pxAW0ols+xMlEAdBfFPC1SFkq2Q2EQ78aqu6f2jSN2KRUCZVrfK
         1hnuwavTMRwB5TQhWfAZ7/j7iJ21lfZW5ItfVPU0BNdBBHA1PFaeavuWYji0Y+Nl8ngW
         Z8EA==
X-Forwarded-Encrypted: i=1; AJvYcCUj/NA2U8eW7qfgLorpQc17n809XwDCIXzImEbF35zHgxiWaL95l+P9p3cpEuSmDDCrTzNJatTeU/kdLFAw@lists.linux.dev
X-Gm-Message-State: AOJu0YxaBmoCGk9+3rmDdo4oHgUfETDHdtXQ/IgcWB2zj8eijeYC93sC
	0eW68A+3ejVmeYztNjHQXbMuJYPUkNihj8MMwnjy8B85t65y+Om5ShYyzB7+g+o=
X-Gm-Gg: ASbGnct0UfviwDwYIVk7jKy/KdTsfu7YQ/Ucaf545JSsfUEBmtO5F4bhPeDjXKSLcXc
	EMkzUbBwUjK2+L8zyKd/eM5fBQtmLX/LLDM2FYwRMGSHTqrOqBTvKJArogNnYvaJqy+kijkBWIY
	K+7t9N0R6MstW+LPdjgT1obLr352+Zhz9+WH7CGb25EePE87V9BqBxH8rxggT9ulvjhucGOVRLN
	YgtsO6aJiOI6jHCt38f94Ug6pf03tVeOE+SURwtrm8cytM+0jDN6vcrd/wl4n1W8VICzXEeIvQG
	c71yZjAPHoFyNXn9pBiD6FJbzhGsjhKbO2u/u2FWdNjagQ==
X-Google-Smtp-Source: AGHT+IGtxzE8wAOWlAdjYzTntNGqxwmtVuDDyvwU9/TJJrOIdTmNjZWkqa1rd3GW7f1YIKQdzA7+Gw==
X-Received: by 2002:a5d:5f4f:0:b0:3a0:7afd:cbfd with SMTP id ffacd0b85a97d-3a0b43b6901mr2828659f8f.7.1746616166337;
        Wed, 07 May 2025 04:09:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b3d0a77asm2786934f8f.56.2025.05.07.04.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 04:09:25 -0700 (PDT)
Date: Wed, 7 May 2025 14:09:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ashish Kalra <ashish.kalra@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: [linux-next:master 1170/9308] drivers/crypto/ccp/sev-dev.c:1312
 __sev_platform_init_locked() error: we previously assumed 'error' could be
 null (see line 1297)
Message-ID: <202505071746.eWOx5QgC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: 9770b428b1a28360663f1f5e524ee458b4cf454b [1170/9308] crypto: ccp - Move dev_info/err messages for SEV/SNP init and shutdown
config: x86_64-randconfig-161-20250430 (https://download.01.org/0day-ci/archive/20250507/202505071746.eWOx5QgC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505071746.eWOx5QgC-lkp@intel.com/

smatch warnings:
drivers/crypto/ccp/sev-dev.c:1312 __sev_platform_init_locked() error: we previously assumed 'error' could be null (see line 1297)

vim +/error +1312 drivers/crypto/ccp/sev-dev.c

3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1264  static int __sev_platform_init_locked(int *error)
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1265  {
1ca5614b84eed5 drivers/crypto/ccp/sev-dev.c Brijesh Singh         2024-01-25  1266  	int rc, psp_ret = SEV_RET_NO_FW_CALL;
efb339a83368ab drivers/crypto/ccp/sev-dev.c Peter Gonda           2023-03-07  1267  	struct sev_device *sev;
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1268  
1ca5614b84eed5 drivers/crypto/ccp/sev-dev.c Brijesh Singh         2024-01-25  1269  	if (!psp_master || !psp_master->sev_data)
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1270  		return -ENODEV;
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1271  
1ca5614b84eed5 drivers/crypto/ccp/sev-dev.c Brijesh Singh         2024-01-25  1272  	sev = psp_master->sev_data;
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1273  
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1274  	if (sev->state == SEV_STATE_INIT)
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1275  		return 0;
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1276  
24512afa4336a1 drivers/crypto/ccp/sev-dev.c Brijesh Singh         2024-01-25  1277  	__sev_platform_init_handle_tmr(sev);
1ca5614b84eed5 drivers/crypto/ccp/sev-dev.c Brijesh Singh         2024-01-25  1278  
7364a6fbca45f8 drivers/crypto/ccp/sev-dev.c Tom Lendacky          2024-01-25  1279  	rc = __sev_platform_init_handle_init_ex_path(sev);
d8da2da21fdb1f drivers/crypto/ccp/sev-dev.c Jacky Li              2022-08-16  1280  	if (rc)
d8da2da21fdb1f drivers/crypto/ccp/sev-dev.c Jacky Li              2022-08-16  1281  		return rc;
d8da2da21fdb1f drivers/crypto/ccp/sev-dev.c Jacky Li              2022-08-16  1282  
dbf07b544ca12c drivers/crypto/ccp/sev-dev.c Borislav Petkov (AMD  2023-03-07  1283) 	rc = __sev_do_init_locked(&psp_ret);
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1284  	if (rc && psp_ret == SEV_RET_SECURE_DATA_INVALID) {
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1285  		/*
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1286  		 * Initialization command returned an integrity check failure
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1287  		 * status code, meaning that firmware load and validation of SEV
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1288  		 * related persistent data has failed. Retrying the
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1289  		 * initialization function should succeed by replacing the state
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1290  		 * with a reset state.
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1291  		 */
efb339a83368ab drivers/crypto/ccp/sev-dev.c Peter Gonda           2023-03-07  1292  		dev_err(sev->dev,
efb339a83368ab drivers/crypto/ccp/sev-dev.c Peter Gonda           2023-03-07  1293  "SEV: retrying INIT command because of SECURE_DATA_INVALID error. Retrying once to reset PSP SEV state.");
dbf07b544ca12c drivers/crypto/ccp/sev-dev.c Borislav Petkov (AMD  2023-03-07  1294) 		rc = __sev_do_init_locked(&psp_ret);
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1295  	}
efb339a83368ab drivers/crypto/ccp/sev-dev.c Peter Gonda           2023-03-07  1296  
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07 @1297  	if (error)
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1298  		*error = psp_ret;

The old code assumes "error" can be NULL.

e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1299  
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24  1300  	if (rc) {
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24  1301  		dev_err(sev->dev, "SEV: %s failed %#x, rc %d\n",
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24  1302  			sev_init_ex_buffer ? "INIT_EX" : "INIT", psp_ret, rc);
200664d5237f3f drivers/crypto/ccp/psp-dev.c Brijesh Singh         2017-12-04  1303  		return rc;
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24  1304  	}
200664d5237f3f drivers/crypto/ccp/psp-dev.c Brijesh Singh         2017-12-04  1305  
b93566f1bb54e0 drivers/crypto/ccp/sev-dev.c Rijo Thomas           2019-12-04  1306  	sev->state = SEV_STATE_INIT;
0fc5deae03a272 drivers/crypto/ccp/psp-dev.c Tom Lendacky          2019-10-03  1307  
0fc5deae03a272 drivers/crypto/ccp/psp-dev.c Tom Lendacky          2019-10-03  1308  	/* Prepare for first SEV guest launch after INIT */
0fc5deae03a272 drivers/crypto/ccp/psp-dev.c Tom Lendacky          2019-10-03  1309  	wbinvd_on_all_cpus();
0fc5deae03a272 drivers/crypto/ccp/psp-dev.c Tom Lendacky          2019-10-03  1310  	rc = __sev_do_cmd_locked(SEV_CMD_DF_FLUSH, NULL, error);
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24  1311  	if (rc) {
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24 @1312  		dev_err(sev->dev, "SEV: DF_FLUSH failed %#x, rc %d\n",
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24  1313  			*error, rc);
                                                                                                        ^^^^^^
The new code dereferences it without checking.

0fc5deae03a272 drivers/crypto/ccp/psp-dev.c Tom Lendacky          2019-10-03  1314  		return rc;
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24  1315  	}
0fc5deae03a272 drivers/crypto/ccp/psp-dev.c Tom Lendacky          2019-10-03  1316  
b93566f1bb54e0 drivers/crypto/ccp/sev-dev.c Rijo Thomas           2019-12-04  1317  	dev_dbg(sev->dev, "SEV firmware initialized\n");
200664d5237f3f drivers/crypto/ccp/psp-dev.c Brijesh Singh         2017-12-04  1318  
b64fa5fc9f4495 drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1319  	dev_info(sev->dev, "SEV API:%d.%d build:%d\n", sev->api_major,
b64fa5fc9f4495 drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1320  		 sev->api_minor, sev->build);
b64fa5fc9f4495 drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1321  
b64fa5fc9f4495 drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1322  	return 0;
200664d5237f3f drivers/crypto/ccp/psp-dev.c Brijesh Singh         2017-12-04  1323  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

