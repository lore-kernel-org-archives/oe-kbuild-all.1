Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB0A16E885
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186807; cv=none; b=JXwhvX2nRXAg8DaFz7lrtBScJA9D4v/Gz2i2uVw4REwLVYpK4Rej+5/XZsEKTTeTVkZN3cEhyBz4IxdNn9gY2JypfaU3N6CDlDASM1Enhs+e66SEkZkAPqcnTlWyBBUl4t7oGlCvlsBExoGAkcwWK7nqdC8dcVs4hefXQ11sm3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186807; c=relaxed/simple;
	bh=To1WttjKsXxJBBOgKpjCYe0t4R2vRFdpQUxL3hP0lnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qLlYPHi3gIOYw8E5RZmBDBcx65gRU88cBo7W7GwwhsdaoUiOyKuGZewkj96HKYVSCqUQNGLSua6CPh9EnHjCD4G5w8tUqc79RetmRXoNh89bhYzqlu2f0ZGpTuU6Jt+LTdaMHHkCnvRymzp5OHktBXaeXcuWVl+DvMJoiJ3QPv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ltpaxaka; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ltpaxaka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718186806; x=1749722806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=To1WttjKsXxJBBOgKpjCYe0t4R2vRFdpQUxL3hP0lnc=;
  b=LtpaxakaMCVb7FaTB50uhTQyhKpMkOKH4JJ5KjkVi5fdbF13rKngd20R
   JExiXnWmBpOIrEHKTiiRoH6zj5f+k5akV3f0D6ngabrHXF2/R3m+q+Nh6
   zCNAA+aMBs9+4FmoVLdgPgMGNNR4roNkvC0WVh0xQxpF+BCsVNEnZOIsT
   aKVQGwv2IgukX2rdZ9hgZTEieRwHqd0OWrACRUK2iHzH1i02Xt5qvIUf8
   iJbF94UO4+NREfVJzXKTQ8kgGIQQtjkibX6L4yvFqovvF6mIDFeYk63Dp
   07kQ/Bc+wxxtfjOfr5PQjlxJ07h0bHfIKvProJSVySHwmsBS6hVJ/Neol
   g==;
X-CSE-ConnectionGUID: k3/cgvrfSliBX+qBP+UD8g==
X-CSE-MsgGUID: zghu95a8SqSqLT4yJeZXuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15070007"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="15070007"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 03:06:46 -0700
X-CSE-ConnectionGUID: MRj5Um5HSh2ppbvaj34Fwg==
X-CSE-MsgGUID: uEfoPTIiQCyfipFR7iPCNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="40444129"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jun 2024 03:06:45 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHKsM-0001RO-0g;
	Wed, 12 Jun 2024 10:06:42 +0000
Date: Wed, 12 Jun 2024 18:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-v6.10-rc3 53/74]
 drivers/soc/qcom/qcom_pd_mapper.c:79:13: error: implicit declaration of
 function 'kzalloc' is invalid in C99
Message-ID: <202406121845.iiYY0xjK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.10-rc3
head:   5475612ad98c55b4a83979078f8326963b1538b6
commit: cc7fd75b1dac0e180d13d78127035931503f6fef [53/74] soc: qcom: add pd-mapper implementation
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240612/202406121845.iiYY0xjK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121845.iiYY0xjK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121845.iiYY0xjK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/qcom_pd_mapper.c:79:13: error: implicit declaration of function 'kzalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   service = kzalloc(sizeof(*service), GFP_KERNEL);
                             ^
   drivers/soc/qcom/qcom_pd_mapper.c:79:11: warning: incompatible integer to pointer conversion assigning to 'struct qcom_pdm_service *' from 'int' [-Wint-conversion]
                   service = kzalloc(sizeof(*service), GFP_KERNEL);
                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/qcom_pd_mapper.c:89:11: error: implicit declaration of function 'kzalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           domain = kzalloc(sizeof(*domain), GFP_KERNEL);
                    ^
   drivers/soc/qcom/qcom_pd_mapper.c:89:9: warning: incompatible integer to pointer conversion assigning to 'struct qcom_pdm_domain *' from 'int' [-Wint-conversion]
           domain = kzalloc(sizeof(*domain), GFP_KERNEL);
                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/qcom/qcom_pd_mapper.c:93:4: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           kfree(service);
                           ^
   drivers/soc/qcom/qcom_pd_mapper.c:140:4: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           kfree(domain);
                           ^
   drivers/soc/qcom/qcom_pd_mapper.c:144:3: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   kfree(service);
                   ^
   drivers/soc/qcom/qcom_pd_mapper.c:160:8: error: implicit declaration of function 'kzalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
                 ^
   drivers/soc/qcom/qcom_pd_mapper.c:160:6: warning: incompatible integer to pointer conversion assigning to 'struct servreg_get_domain_list_resp *' from 'int' [-Wint-conversion]
           rsp = kzalloc(sizeof(*rsp), GFP_KERNEL);
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/qcom_pd_mapper.c:211:2: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           kfree(rsp);
           ^
   drivers/soc/qcom/qcom_pd_mapper.c:557:2: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           kfree(data);
           ^
   drivers/soc/qcom/qcom_pd_mapper.c:585:9: error: implicit declaration of function 'kzalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           data = kzalloc(sizeof(*data), GFP_KERNEL);
                  ^
   drivers/soc/qcom/qcom_pd_mapper.c:585:7: warning: incompatible integer to pointer conversion assigning to 'struct qcom_pdm_data *' from 'int' [-Wint-conversion]
           data = kzalloc(sizeof(*data), GFP_KERNEL);
                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/qcom_pd_mapper.c:594:3: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   kfree(data);
                   ^
   4 warnings and 10 errors generated.


vim +/kzalloc +79 drivers/soc/qcom/qcom_pd_mapper.c

    63	
    64	static int qcom_pdm_add_service_domain(struct qcom_pdm_data *data,
    65					       const char *service_name,
    66					       const char *domain_name,
    67					       u32 instance_id)
    68	{
    69		struct qcom_pdm_service *service;
    70		struct qcom_pdm_domain *domain;
    71	
    72		service = qcom_pdm_find(data, service_name);
    73		if (service) {
    74			list_for_each_entry(domain, &service->domains, list) {
    75				if (!strcmp(domain->name, domain_name))
    76					return -EBUSY;
    77			}
    78		} else {
  > 79			service = kzalloc(sizeof(*service), GFP_KERNEL);
    80			if (!service)
    81				return -ENOMEM;
    82	
    83			INIT_LIST_HEAD(&service->domains);
    84			service->name = service_name;
    85	
    86			list_add_tail(&service->list, &data->services);
    87		}
    88	
    89		domain = kzalloc(sizeof(*domain), GFP_KERNEL);
    90		if (!domain) {
    91			if (list_empty(&service->domains)) {
    92				list_del(&service->list);
  > 93				kfree(service);
    94			}
    95	
    96			return -ENOMEM;
    97		}
    98	
    99		domain->name = domain_name;
   100		domain->instance_id = instance_id;
   101		list_add_tail(&domain->list, &service->domains);
   102	
   103		return 0;
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
