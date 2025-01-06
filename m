Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B8B1DD874
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 11:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736162255; cv=none; b=FtFiDi+8YZOwReMJQt32zROwVqpGLJJ/QYMFlI6V71cVUG7Gi58quSobWbhU95XWBwLcHQfqoakGwpmSg01hSLpli30r4hCW5IhmgodBG5z6+qsXgsnOk1fIFEXFUc1ZC/RGa3MzCXj07KgcX+3zC1gYi+YO6c0sKJ09O1CVadg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736162255; c=relaxed/simple;
	bh=zQ8lZdDFKjkDjUpMKpWBlUdOeMsD2gyIQ7BzDZNmKAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NLykozj6wSBUObQ/oNiZUf9p70xNUuPIfMa3oo2K/WGOvubgCDeHo4H969t99ztczFC4KXIvIb+1SIlIedtEnTtS0qJhIHST7PeMalupYAnadAc4itj2CUSpvjWM5oyFEJsu8A4Glf0qylUVs/rZGjF158GRg3C2VYm/bXHbNsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eIN+Na3M; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eIN+Na3M"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436281c8a38so101816685e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 03:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736162251; x=1736767051; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v85qqGmy7umR0n2keQwewgl2/GS+kuSYgs++w251gTM=;
        b=eIN+Na3MsAf5o0g4AgPuBKvsVMGO9mQOD+UGboIsZVGu0CCRoUJKy9bZa362p7ke7E
         Y+nF0//br96PA/boDN2bmDndixBw9mcdn7idg1l7vZpFOvozYsxWnsN+Ag8NWDRUXr0U
         pl7wnWhGUTUJYH3fcI9E+41u+MwzCIvnee2KbMoJWZOMAjPd5IiAgj5jXTzVe+dsETJF
         y58i7QUF0exf6EX0IeBKwVuVlN/rBaCfa5KsE1ENLsWFTICpe//Y18H3WZC12EboQBam
         Pmja5aCH7x/S0nNsg2pePojHN30bUSATe5tpiXH9Kbj20VRSDSgFHPTksp6pLazOzXIY
         eV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736162251; x=1736767051;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v85qqGmy7umR0n2keQwewgl2/GS+kuSYgs++w251gTM=;
        b=noBwXLgIeFwaW4J12eZWJTDk98VXhE+CHt9fQxHgFmmf44+Q73tavhGE6vLr1kUwFj
         P/oYq/9fIBF3J1FYuIdNlPeyEDF8V3IGmipi7Bij9KgsYVIlIgG3VTROQkxFMsnBbx9g
         4RhdMrtE0ScuqZK4GDQV8kwtjsZQjsy2KVYjT9MscNWR/H3rOhbfd0ZSULHTyNWdoTNy
         i0HrIJVWP6F0xx4JGx9qPXeMc+kOCHbX4/MKUDf0wGt80pEXmENsRy/IMNF5rdlq2WGB
         t0PjqtfSgCV/CCkiNXoscxHx6DFmZuWw59nYlZMNyWMdjc160TWVQCWq+eUyqbsLLA4Q
         oymA==
X-Forwarded-Encrypted: i=1; AJvYcCV88PRN8Et4M51XC6neQA8UaMyfi7rxRrJoP6md2kgzEYoUorHgfDlPSoD+65YC6BmaK3tLm0GxbWMyttZp@lists.linux.dev
X-Gm-Message-State: AOJu0YxEyBiX0fuvO4JoaZHsTex+hJxA654EXxXAqoOBAdhTz0Jk1S4U
	wxbEZ4ak8Vd67tP7JxKSbvRkl8fVSjO0N9FfyDl1ld98KqzaPxx1YXA7Vaj6GhI=
X-Gm-Gg: ASbGncsLpmVBqSJxJrkQ8xOf/GbIajIupeRB0/9Ls/SYhRNOqDUMuPlIOCQj9M1mlRN
	66hWO5tWIoow9IhZKAYA2LTqpmaEozCieSzc9E3DERvDQkwyNwtHJIt5c7aRe0KQQkRZmbp8AFW
	AK0dwMJehaXvRLO0FfT4qL0Tq7pMJrmApqv3pHyLwPmo/UcjWfNlFJbrbqjSX2Ju6omKq5KZaUX
	rqScbMkYm4VkjGymb6CmO+Ed25euDLFfHLU5w6QpiXPb72sMjZZrjw4zHixwg==
X-Google-Smtp-Source: AGHT+IEGpwHJCfNwNupAYXNQHtWVarkls9Cqq5fauPBkC8uGLwnuzezVberEf761nBy3jhMv4PbruQ==
X-Received: by 2002:a5d:584e:0:b0:385:e8dd:b143 with SMTP id ffacd0b85a97d-38a221eaf78mr52547229f8f.19.1736162251447;
        Mon, 06 Jan 2025 03:17:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a47c9b2efsm28099352f8f.91.2025.01.06.03.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 03:17:31 -0800 (PST)
Date: Mon, 6 Jan 2025 14:17:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Bowen You <youbowen2@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1693/1693]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c:1320
 dcn21_link_encoder_create() warn: possible memory leak of 'enc21'
Message-ID: <8b11ef6e-818f-4ffd-972a-f2aab4119180@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   92381e91108f99289464dbb6fbe45ffc4d6d037b
commit: ccf7fa56eb24845c661db94e85cbf500c9f56f6d [1693/1693] drm/amd/display: Fix out-of-bounds access in 'dcn21_link_encoder_create'
config: x86_64-randconfig-161-20250103 (https://download.01.org/0day-ci/archive/20250103/202501031656.Si294le5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501031656.Si294le5-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c:1320 dcn21_link_encoder_create() warn: possible memory leak of 'enc21'

vim +/enc21 +1320 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c

91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1311  static struct link_encoder *dcn21_link_encoder_create(
e216431b63aef8 Aurabindo Pillai       2022-04-01  1312  	struct dc_context *ctx,
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1313  	const struct encoder_init_data *enc_init_data)
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1314  {
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1315  	struct dcn21_link_encoder *enc21 =
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1316  		kzalloc(sizeof(struct dcn21_link_encoder), GFP_KERNEL);
bf7f5ac3167a75 Yogesh Mohan Marimuthu 2019-10-02  1317  	int link_regs_id;
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1318  
ccf7fa56eb2484 Srinivasan Shanmugam   2024-12-30  1319  	if (!enc21 || enc_init_data->hpd_source >= ARRAY_SIZE(link_enc_hpd_regs))
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02 @1320  		return NULL;


This should be:

	if (!enc21)
		return NULL;

	if (enc_init_data->hpd_source >= ARRAY_SIZE(link_enc_hpd_regs)) {
		kfree(enc21);
		return NULL;
	}

91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1321  
bf7f5ac3167a75 Yogesh Mohan Marimuthu 2019-10-02  1322  	link_regs_id =
bf7f5ac3167a75 Yogesh Mohan Marimuthu 2019-10-02  1323  		map_transmitter_id_to_phy_instance(enc_init_data->transmitter);
bf7f5ac3167a75 Yogesh Mohan Marimuthu 2019-10-02  1324  
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1325  	dcn21_link_encoder_construct(enc21,
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1326  				      enc_init_data,
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1327  				      &link_enc_feature,
bf7f5ac3167a75 Yogesh Mohan Marimuthu 2019-10-02  1328  				      &link_enc_regs[link_regs_id],
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1329  				      &link_enc_aux_regs[enc_init_data->channel - 1],
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1330  				      &link_enc_hpd_regs[enc_init_data->hpd_source],
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1331  				      &le_shift,
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1332  				      &le_mask);
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1333  
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1334  	return &enc21->enc10.base;
91c665bdc1d54f Bhawanpreet Lakha      2019-10-02  1335  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

