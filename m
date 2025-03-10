Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ABD2222A1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741593745; cv=none; b=equBk2/C7Czzk/3M9Rxm98ydDYpCWEoOMf6/z1aA8GkmLheDY8u9q40L7ylp7BlWaRNiwupkyh2LfgacV3gDqUFKVthwfNkEAUQCNUMI2RESivArOvjEqpLnWMXEZRNwuE9vSfOwQjcbIDu/c78zUfaL9mRW1dmq5c5sGMfy204=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741593745; c=relaxed/simple;
	bh=nRzXGoBd19Y5/W3RnginWzeNUeeDAMRlSdLs5vQ01QE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=sCeq9NRDziWmmx2KegZEEBHSM2KCN8CqiUjNBxTaQGQqTWUnRXmTVv+nPe3S6dykpQmcWuyiF9XTsJijWq+HFp3USAHvyZaTB9g6H4PhwkbLm+d5FC3qmnH274LdeBsX42rfdp0epiSKkLzEhsDJGrwIxS6rGsUQaaEd9jR74aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FxLiEwXy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FxLiEwXy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso22232515e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 01:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741593741; x=1742198541; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i8vsoR0XtNwhNc8uqv+HeeAftIb3SZaHuCchGTf/qK4=;
        b=FxLiEwXyLexpTrrlFc4l0NipsABI97GmaZyfWg0ykwTYB8W610SpP+5+lQ7dCCVYra
         TvcDv9r97e5FgENsjF4BieSkThw6V6zfqLw1aDWAohkyJjAJflyDfpnaLfqidmtSTjpU
         r94f2qsQ2qaZ4I2jhsooPjNFGfKA23JLG2O4AQWSQWkyvp3uWIQP/hz9Wxp9Lskw0uhf
         7o7AD4klev+onXOYKOK6GgFwf4CT7ja5U+8Xr0wcvGGEAhs4R0wNwHleWcr7ZwvBFya9
         Lr8Fs4eS4i9hJu/dBacArAVDGG8Id9QpFHD34qczdYIGVjVFH4BsgWZTJ90XnEwNyRw1
         9L2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741593741; x=1742198541;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8vsoR0XtNwhNc8uqv+HeeAftIb3SZaHuCchGTf/qK4=;
        b=ovWpCxfAWdr/6gwz8gqKRMxxBfkrs85LwbBBxHu+mXyMjjbUXoIHFG8EyPnr60dW02
         nppJvh0tvpA0HO8/e45yWaA/lolviK3QumKeSBzgSnNI/BYWDmFXlFz0CDxDYgPwy/pD
         rAqOh4YATbG/oiSnI4x7pfkBAH3AOjQ4xTKzh37hyzoETIsLgoVqki9vCCdit+UPJMpy
         aHaC5KOrSVd3ocY7okBwLBpCkh7QgoLVf6ymWRUGn4YziP68LxxOlfjNBOC0trfsBfbv
         jF1MASu8okC9lQepnxR8gE32e4Goj36b0G4parl/l8wCAcZp+uycpJlIQdD8CER/cXrw
         88vw==
X-Forwarded-Encrypted: i=1; AJvYcCVj/cVbscVuQ2kbJFP79pN7sv0TfOH1WQEcIcK4lLXI4mCir2PeNiTMU/oCtg2eIFgXv6vuSuiprOR9/EfM@lists.linux.dev
X-Gm-Message-State: AOJu0YwuHkKj/t//4FvWmhzI2XePithPSCycn1wrsIHgJ6aUf3Us36UN
	WgesTQW+7zNlR4C9auVXDTBeUU5fR00WdukEfaf3x2TBdy6l5mkFINXO9at2UzY=
X-Gm-Gg: ASbGncv08/tJUtS4bMavfVGxIujtmTEEI/SP3ejgj3eMWTrkCLFAR/5R7xRN55qmSGc
	fh2aCIXTdhBOfYElVlmlxYwZZiVC+fS3gQ2exzvAYEFJFElM0zw/rcUkjhu3fluHlTpV61Q0AJe
	NFZIziH/IgPu/y0vBYenziQaD6H3QlIti3sOAzbCbpLED3P1GXPvjleAWVkygKNqloWoXYvyUFe
	hgAyauVhw8V1ExXArHW+Z9P+bygS50mgXhzuj2X0mmES5MU/2Kio1Y4WIgKqsHRMhWn3/Fu60yK
	0batew3YJgT2r9/jAnuggGNTkx3G5ev7ELDpIZpbu2IefqiAwg==
X-Google-Smtp-Source: AGHT+IEmOTKGzx90VNTsmr7R1QpkX49RScln2y40rBh0JpkUW/vdZodH2LPxETHoGOKthxkf0ChEcg==
X-Received: by 2002:a7b:c4d4:0:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-43cf5139abdmr22749185e9.14.1741593741591;
        Mon, 10 Mar 2025 01:02:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43cf7c8249bsm28163885e9.7.2025.03.10.01.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 01:02:20 -0700 (PDT)
Date: Mon, 10 Mar 2025 11:02:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jonathan Cavitt <jonathan.cavitt@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, saurabhg.gupta@intel.com,
	alex.zuo@intel.com, jonathan.cavitt@intel.com,
	joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
	jianxun.zhang@intel.com, shuicheng.lin@intel.com,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 6/6] drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
Message-ID: <8c122809-5aa9-4531-8967-66e03e5023b2@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307224125.111430-7-jonathan.cavitt@intel.com>

Hi Jonathan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cavitt/drm-xe-xe_gt_pagefault-Disallow-writes-to-read-only-VMAs/20250308-064247
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250307224125.111430-7-jonathan.cavitt%40intel.com
patch subject: [PATCH v6 6/6] drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
config: i386-randconfig-141-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091053.Hg9hUB8c-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503091053.Hg9hUB8c-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vm.c:3557 fill_faults() warn: iterator 'i' not incremented

vim +/i +3557 drivers/gpu/drm/xe/xe_vm.c

24e54814071dd04 Jonathan Cavitt 2025-03-07  3552  static int fill_faults(struct xe_vm *vm,
24e54814071dd04 Jonathan Cavitt 2025-03-07  3553  		       struct drm_xe_vm_get_faults *args)
24e54814071dd04 Jonathan Cavitt 2025-03-07  3554  {
24e54814071dd04 Jonathan Cavitt 2025-03-07  3555  	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->faults);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3556  	struct xe_vm_pf_entry *entry;
24e54814071dd04 Jonathan Cavitt 2025-03-07 @3557  	int ret = 0, i = 0;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3558  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3559  	spin_lock(&vm->pfs.lock);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3560  	list_for_each_entry(entry, &vm->pfs.list, list) {
24e54814071dd04 Jonathan Cavitt 2025-03-07  3561  		struct xe_pagefault *pf = entry->pf;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3562  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3563  		ret = put_user(pf->page_addr, &usr_ptr->address);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3564  		if (ret)
24e54814071dd04 Jonathan Cavitt 2025-03-07  3565  			break;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3566  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3567  		ret = put_user(pf->address_type, &usr_ptr->address_type);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3568  		if (ret)
24e54814071dd04 Jonathan Cavitt 2025-03-07  3569  			break;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3570  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3571  		ret = put_user(1, &usr_ptr->address_precision);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3572  		if (ret)
24e54814071dd04 Jonathan Cavitt 2025-03-07  3573  			break;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3574  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3575  		usr_ptr++;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3576  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3577  		if (i == args->fault_count)

if (++i >= args->fault_count) ?

24e54814071dd04 Jonathan Cavitt 2025-03-07  3578  			break;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3579  	}
24e54814071dd04 Jonathan Cavitt 2025-03-07  3580  	spin_unlock(&vm->pfs.lock);
24e54814071dd04 Jonathan Cavitt 2025-03-07  3581  
24e54814071dd04 Jonathan Cavitt 2025-03-07  3582  	return ret ? -EFAULT : 0;
24e54814071dd04 Jonathan Cavitt 2025-03-07  3583  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

