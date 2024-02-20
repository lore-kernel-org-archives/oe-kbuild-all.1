Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AB85CDF3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 08:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708417871; cv=none; b=UXXrGZlf2qdMmoEPT3Xr813whz8qm7hgDp4F1FwTeu6aujR+IL9c1JzlbcDJ9viLQyE9kwPFKSes4fETuWYGGAytf/ylAw4SP/LVFqY7ZRuvgr6NXJsCiMoFsX72lE9HIXYYBUVrOKxJ804WkP4ec+vRidPGn0hz3slop+pOdD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708417871; c=relaxed/simple;
	bh=z+ya6S79kXt1F9acGghW+fwOJyEHYJ6/iTaudsflj6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Lj6nXYNDFhzfzSe8XLTnBXUjXnCWmD3Gc7zpPETYrhDqUZVDtCJwdnLyqvgHf7kI+OhT9vfO2402VwVuNGT30e0czucRSNVevjvl3AsQVZ44ULXecdGPZKym+E9yQF8GFrbBXOp921E5r7FwsHuDpVRRYjND/AKH1HBZcs6aTsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lJCE7jpi; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lJCE7jpi"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so5261889a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 00:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708417868; x=1709022668; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ab/JTj1QFpZ37QZKffvrycyGpJUjaXceXuFCIRH5HM=;
        b=lJCE7jpiCrAgDB30EzOM0uDKq+BNMvh/JddiDkGGeN1MtEVfrowaPItxuhZxLLsetO
         0EcAqmKU1RKy0tP1GyEabVbZF234mhIg+QVP86S2f4Gt3dJ/uSqQtfvUpDUVlJpOvkbS
         clB/xTLtFNxK+a6eBkLrEQcVynna+Knp3R4PRi7zWFELBZa8SEYO4aVggOwpCxp5mSb5
         w+cCd8NONyDR2lGZSHlLH8wMss7iJrudsMHzD/Aoh2NmNtGQJcCIpigcj/jOrYg3Zc1F
         67n+NahLyjaPOQ26jb1O97pS0lL/9r6scY3O1FF+4KC0ldwONvV3FyKYHXF+pJ80m9Q8
         zp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708417868; x=1709022668;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ab/JTj1QFpZ37QZKffvrycyGpJUjaXceXuFCIRH5HM=;
        b=mRNAW5jOUKddhKb9GrtJyPr6vDIqBGPgBZZoyCxWOwCKSgANZKrSNe9mNM3LPn/DJV
         eSv7m3UdRBS7jLV0Wbfff/E7hT4FgBXNAUz6Nj3XQtIrrqf0K7PA2rIaQGPvLNI5ZVX4
         LEzvxKsLsIlgyDg0VCwVoJpLhD/i2jLylBBN69F85pl0kiiGBF8vi1YVx+GKdagibrh5
         wNZkfZJg+9zh3MwTHc5YFSHFRhHMgv28/moDLHpp9NCh/adf2wV1Y3XB5ra2tc5I9AEb
         sr6HGwGDDLsy/8f+S/fIwzOSW2ugvCxY6UFt67AT1Zap1UUQQ4nSUEoPESbGORsCROUx
         y6PA==
X-Forwarded-Encrypted: i=1; AJvYcCVKkXfp8Fp4o0itIew6cyK2cxmHXw3IoOFhnwRk4oxp4QXKxXy60ZrSB+T1rkMOpSETYtnUfDm+Jhz5vBJDTC3+oKXHf1u3wnqPpkZhpg==
X-Gm-Message-State: AOJu0YwvdkD1rlX38Obg791RSJ0XZfcgG4/dmedeE0ljz45knn0BH/XL
	vEO/M/tSRkCn285oq8uzpF+W41Sf3Wu2KOcQZknVaIaO+disuETSsjMo0AbERMk=
X-Google-Smtp-Source: AGHT+IGAaEhaVOGHApuf34csO4rKG4tigNNuFaXUxWuI/pXCnkkn8Z9Z0GKlxKZe6WSivDK0AuUr0A==
X-Received: by 2002:a17:906:60f:b0:a3e:b8ac:288f with SMTP id s15-20020a170906060f00b00a3eb8ac288fmr2516737ejb.4.1708417867681;
        Tue, 20 Feb 2024 00:31:07 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id tz3-20020a170907c78300b00a3e0b7e7217sm3633463ejc.48.2024.02.20.00.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 00:31:07 -0800 (PST)
Date: Tue, 20 Feb 2024 11:31:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Eddie James <eajames@linux.ibm.com>,
	linux-fsi@lists.ozlabs.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
	joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
	mturquette@baylibre.com, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: Re: [PATCH 12/33] fsi: core: Allow cfam device type aliases
Message-ID: <13393c19-6de5-427d-8b4a-2e50cfe9459f@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215220759.976998-13-eajames@linux.ibm.com>

Hi Eddie,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/dt-bindings-clock-ast2600-Add-FSI-clock/20240216-061934
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240215220759.976998-13-eajames%40linux.ibm.com
patch subject: [PATCH 12/33] fsi: core: Allow cfam device type aliases
config: arm64-randconfig-r081-20240216 (https://download.01.org/0day-ci/archive/20240220/202402201532.dvENQrDs-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402201532.dvENQrDs-lkp@intel.com/

smatch warnings:
drivers/fsi/fsi-core.c:919 __fsi_get_new_minor() error: testing array offset 'type' after use.

vim +/type +919 drivers/fsi/fsi-core.c

3f4ac5b0b27f16 Eddie James            2024-02-15  894  static int __fsi_get_new_minor(struct fsi_slave *slave, struct device_node *np,
3f4ac5b0b27f16 Eddie James            2024-02-15  895  			       enum fsi_dev_type type, dev_t *out_dev, int *out_index)
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  896  {
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  897  	int cid = slave->chip_id;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  898  	int id;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  899  
3f4ac5b0b27f16 Eddie James            2024-02-15  900  	if (np) {
3f4ac5b0b27f16 Eddie James            2024-02-15  901  		int aid = of_alias_get_id(np, fsi_dev_type_names[type]);
                                                                                                                 ^^^^
if type >= 4 we are in trouble

3f4ac5b0b27f16 Eddie James            2024-02-15  902  
3f4ac5b0b27f16 Eddie James            2024-02-15  903  		if (aid >= 0) {
3f4ac5b0b27f16 Eddie James            2024-02-15  904  			/* Use the same scheme as the legacy numbers. */
3f4ac5b0b27f16 Eddie James            2024-02-15  905  			id = (aid << 2) | type;
3f4ac5b0b27f16 Eddie James            2024-02-15  906  			id = ida_alloc_range(&fsi_minor_ida, id, id, GFP_KERNEL);
3f4ac5b0b27f16 Eddie James            2024-02-15  907  			if (id >= 0) {
3f4ac5b0b27f16 Eddie James            2024-02-15  908  				*out_index = aid;
3f4ac5b0b27f16 Eddie James            2024-02-15  909  				*out_dev = fsi_base_dev + id;
3f4ac5b0b27f16 Eddie James            2024-02-15  910  				return 0;
3f4ac5b0b27f16 Eddie James            2024-02-15  911  			}
3f4ac5b0b27f16 Eddie James            2024-02-15  912  
3f4ac5b0b27f16 Eddie James            2024-02-15  913  			if (id != -ENOSPC)
3f4ac5b0b27f16 Eddie James            2024-02-15  914  				return id;
3f4ac5b0b27f16 Eddie James            2024-02-15  915  		}
3f4ac5b0b27f16 Eddie James            2024-02-15  916  	}
3f4ac5b0b27f16 Eddie James            2024-02-15  917  
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  918  	/* Check if we qualify for legacy numbering */
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20 @919  	if (cid >= 0 && cid < 16 && type < 4) {
                                                                                    ^^^^^^^^
checked too late

641511bfcc5e01 Eddie James            2023-06-12  920  		/*
641511bfcc5e01 Eddie James            2023-06-12  921  		 * Try reserving the legacy number, which has 0 - 0x3f reserved
641511bfcc5e01 Eddie James            2023-06-12  922  		 * in the ida range. cid goes up to 0xf and type contains two
641511bfcc5e01 Eddie James            2023-06-12  923  		 * bits, so construct the id with the below two bit shift.
641511bfcc5e01 Eddie James            2023-06-12  924  		 */
641511bfcc5e01 Eddie James            2023-06-12  925  		id = (cid << 2) | type;
85f4e899de32ba Eddie James            2023-06-12  926  		id = ida_alloc_range(&fsi_minor_ida, id, id, GFP_KERNEL);
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  927  		if (id >= 0) {
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  928  			*out_index = fsi_adjust_index(cid);
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  929  			*out_dev = fsi_base_dev + id;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  930  			return 0;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  931  		}
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  932  		/* Other failure */
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  933  		if (id != -ENOSPC)
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  934  			return id;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  935  		/* Fallback to non-legacy allocation */
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  936  	}
85f4e899de32ba Eddie James            2023-06-12  937  	id = ida_alloc_range(&fsi_minor_ida, FSI_CHAR_LEGACY_TOP,
85f4e899de32ba Eddie James            2023-06-12  938  			     FSI_CHAR_MAX_DEVICES - 1, GFP_KERNEL);
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  939  	if (id < 0)
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  940  		return id;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  941  	*out_index = fsi_adjust_index(id);
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  942  	*out_dev = fsi_base_dev + id;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  943  	return 0;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  944  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

