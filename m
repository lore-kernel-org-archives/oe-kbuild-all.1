Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3139748A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727616873; cv=none; b=AabllCh6jTfEULvA9O1UqLEMtJ0nnsPZcbMNw/iwke6rcDv14RaM9MP0lgU9WfvyjdpNh0Ts4uhUR4ZalOr4M0vHtyv/YAMsn3lHl9oK/ZqlXrgiXbIBt7tVBDSv9TYslAzcJTRTVXqa/lOexER7LceOlEuZLU2XdmZ92xE25Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727616873; c=relaxed/simple;
	bh=8DwDNnLe9ImHhhCJ2px2vBkVf2MVR/osrurMdfEhg0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kbyfgoA5ZRMNzpOUw8hoACWKeoRXDkp0fg+6zFQpDxsaSV4fBugLTrI3wchVDTGD+zukXIFjTfw4xFZmzZ+vWrWxUX/1DznPQvZJAK9R6/Px1jsxwd+c2KuZbRaIJ/USM68gl8wp1r/R66VWbKje26EvwLkz6gvn6qvKueF55B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OhXt3bqz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhXt3bqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727616872; x=1759152872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8DwDNnLe9ImHhhCJ2px2vBkVf2MVR/osrurMdfEhg0w=;
  b=OhXt3bqzKWhb9DM+Dp1nNOSgwBlXlG92OSir9g3CupoRGtT9b3gpVcwh
   BY+BfonaIbAznOPn13MHHefWaMtEqCeQXCb+ZjuI82MxW/nUI4Xd8iPwx
   aXdgjZnVgzePWgxUZ8RVS+FZ7nMKv7kIFSNDTKalPD6bwWvE4hqVBPEr8
   JR9Bt6lwAQ7LcWoew8b3XyH1yOTo4QJY5syljbApGYifQk15GCr5bLUE5
   qBqZAV1D9ACAUAuriA1iOANH9C71c/rZGHCpBvOJ5Bur8GnWzUdfOQCPZ
   DAKPf0eob4LbRTg7xNVuRjhsGLj7NRBapt9u4K9bKyqDuOY6OrZlVAqwY
   g==;
X-CSE-ConnectionGUID: gqYe3dpwQWW2BNHGvw9eRA==
X-CSE-MsgGUID: i4FjJdEtQNeaj+Tv8+/eWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26217907"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26217907"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 06:34:31 -0700
X-CSE-ConnectionGUID: gNsRW9c1Rw6PGNRCMT1yhg==
X-CSE-MsgGUID: chIdW3i1S+avWEjqvQ375Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="73088121"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Sep 2024 06:34:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suu4C-000OJX-05;
	Sun, 29 Sep 2024 13:34:28 +0000
Date: Sun, 29 Sep 2024 21:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5882/16788]
 drivers/soc/imx/secvio/imx-secvio-debugfs.c:35:5: warning: no previous
 prototype for function 'fuse_reader'
Message-ID: <202409292156.HYLAAIQ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: b0ccc637e081a8f120dc9e98b92a90aa21ce1592 [5882/16788] Merge branch 'firmware/next' into next
config: arm-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240929/202409292156.HYLAAIQ5-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409292156.HYLAAIQ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292156.HYLAAIQ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:35:5: warning: no previous prototype for function 'fuse_reader' [-Wmissing-prototypes]
      35 | int fuse_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         |     ^
   drivers/soc/imx/secvio/imx-secvio-debugfs.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | int fuse_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         | ^
         | static 
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:56:5: warning: no previous prototype for function 'snvs_reader' [-Wmissing-prototypes]
      56 | int snvs_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         |     ^
   drivers/soc/imx/secvio/imx-secvio-debugfs.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      56 | int snvs_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         | ^
         | static 
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:95:5: warning: no previous prototype for function 'snvs_dgo_reader' [-Wmissing-prototypes]
      95 | int snvs_dgo_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         |     ^
   drivers/soc/imx/secvio/imx-secvio-debugfs.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      95 | int snvs_dgo_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         | ^
         | static 
   3 warnings generated.
--
>> drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous prototype for function 'int_imx_secvio_sc_check_state' [-Wmissing-prototypes]
     140 | int int_imx_secvio_sc_check_state(struct device *dev)
         |     ^
   drivers/soc/imx/secvio/imx-secvio-sc.c:140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     140 | int int_imx_secvio_sc_check_state(struct device *dev)
         | ^
         | static 
   drivers/soc/imx/secvio/imx-secvio-sc.c:377:29: warning: variable 'data' set but not used [-Wunused-but-set-variable]
     377 |         struct imx_secvio_sc_data *data;
         |                                    ^
   2 warnings generated.


vim +/fuse_reader +35 drivers/soc/imx/secvio/imx-secvio-debugfs.c

0bc1767ab3eecd Franck LENORMAND 2019-12-05   34  
0bc1767ab3eecd Franck LENORMAND 2019-12-05  @35  int fuse_reader(struct device *dev, u32 id, u32 *value, u8 mul)
0bc1767ab3eecd Franck LENORMAND 2019-12-05   36  {
0bc1767ab3eecd Franck LENORMAND 2019-12-05   37  	struct imx_secvio_sc_data *data = dev_get_drvdata(dev);
0bc1767ab3eecd Franck LENORMAND 2019-12-05   38  	u32 size_to_read = mul * sizeof(u32);
0bc1767ab3eecd Franck LENORMAND 2019-12-05   39  	int ret;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   40  
0bc1767ab3eecd Franck LENORMAND 2019-12-05   41  	ret = nvmem_device_read(data->nvmem, id, size_to_read, value);
0bc1767ab3eecd Franck LENORMAND 2019-12-05   42  	if (ret < 0) {
0bc1767ab3eecd Franck LENORMAND 2019-12-05   43  		dev_err(data->dev, "Failed to read fuse %d: %d\n", id, ret);
0bc1767ab3eecd Franck LENORMAND 2019-12-05   44  		return ret;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   45  	}
0bc1767ab3eecd Franck LENORMAND 2019-12-05   46  
0bc1767ab3eecd Franck LENORMAND 2019-12-05   47  	if (ret != size_to_read) {
0bc1767ab3eecd Franck LENORMAND 2019-12-05   48  		dev_err(data->dev, "Read only %d instead of %d\n", ret,
0bc1767ab3eecd Franck LENORMAND 2019-12-05   49  			size_to_read);
0bc1767ab3eecd Franck LENORMAND 2019-12-05   50  		return -ENOMEM;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   51  	}
0bc1767ab3eecd Franck LENORMAND 2019-12-05   52  
0bc1767ab3eecd Franck LENORMAND 2019-12-05   53  	return 0;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   54  }
0bc1767ab3eecd Franck LENORMAND 2019-12-05   55  
0bc1767ab3eecd Franck LENORMAND 2019-12-05  @56  int snvs_reader(struct device *dev, u32 id, u32 *value, u8 mul)
0bc1767ab3eecd Franck LENORMAND 2019-12-05   57  {
0bc1767ab3eecd Franck LENORMAND 2019-12-05   58  	int ret;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   59  	u32 *v1, *v2, *v3, *v4, *v5;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   60  
0bc1767ab3eecd Franck LENORMAND 2019-12-05   61  	v1 = NULL;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   62  	v2 = NULL;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   63  	v3 = NULL;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   64  	v4 = NULL;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   65  	v5 = NULL;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   66  
0bc1767ab3eecd Franck LENORMAND 2019-12-05   67  	switch (mul) {
0bc1767ab3eecd Franck LENORMAND 2019-12-05   68  	case 5:
0bc1767ab3eecd Franck LENORMAND 2019-12-05   69  		v5 = &value[4];
0bc1767ab3eecd Franck LENORMAND 2019-12-05   70  		fallthrough;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   71  	case 4:
0bc1767ab3eecd Franck LENORMAND 2019-12-05   72  		v4 = &value[3];
0bc1767ab3eecd Franck LENORMAND 2019-12-05   73  		fallthrough;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   74  	case 3:
0bc1767ab3eecd Franck LENORMAND 2019-12-05   75  		v3 = &value[2];
0bc1767ab3eecd Franck LENORMAND 2019-12-05   76  		fallthrough;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   77  	case 2:
0bc1767ab3eecd Franck LENORMAND 2019-12-05   78  		v2 = &value[1];
0bc1767ab3eecd Franck LENORMAND 2019-12-05   79  		fallthrough;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   80  	case 1:
0bc1767ab3eecd Franck LENORMAND 2019-12-05   81  		v1 = &value[0];
0bc1767ab3eecd Franck LENORMAND 2019-12-05   82  		break;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   83  	default:
0bc1767ab3eecd Franck LENORMAND 2019-12-05   84  		return -EINVAL;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   85  	}
0bc1767ab3eecd Franck LENORMAND 2019-12-05   86  
0bc1767ab3eecd Franck LENORMAND 2019-12-05   87  	ret = call_secvio_config(dev, id, SECVIO_CONFIG_READ, v1, v2, v3, v4,
0bc1767ab3eecd Franck LENORMAND 2019-12-05   88  				 v5, mul);
0bc1767ab3eecd Franck LENORMAND 2019-12-05   89  	if (ret < 0)
0bc1767ab3eecd Franck LENORMAND 2019-12-05   90  		dev_err(dev, "Failed to read snvs reg %d: %d\n", id, ret);
0bc1767ab3eecd Franck LENORMAND 2019-12-05   91  
0bc1767ab3eecd Franck LENORMAND 2019-12-05   92  	return ret;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   93  }
0bc1767ab3eecd Franck LENORMAND 2019-12-05   94  
0bc1767ab3eecd Franck LENORMAND 2019-12-05  @95  int snvs_dgo_reader(struct device *dev, u32 id, u32 *value, u8 mul)
0bc1767ab3eecd Franck LENORMAND 2019-12-05   96  {
0bc1767ab3eecd Franck LENORMAND 2019-12-05   97  	struct imx_secvio_sc_data *data = dev_get_drvdata(dev);
0bc1767ab3eecd Franck LENORMAND 2019-12-05   98  	int ret;
0bc1767ab3eecd Franck LENORMAND 2019-12-05   99  
0bc1767ab3eecd Franck LENORMAND 2019-12-05  100  	if (mul != 1)
0bc1767ab3eecd Franck LENORMAND 2019-12-05  101  		return -EINVAL;
0bc1767ab3eecd Franck LENORMAND 2019-12-05  102  
0bc1767ab3eecd Franck LENORMAND 2019-12-05  103  	ret = imx_sc_seco_secvio_dgo_config(data->ipc_handle, id,
0bc1767ab3eecd Franck LENORMAND 2019-12-05  104  					    SECVIO_CONFIG_READ, value);
0bc1767ab3eecd Franck LENORMAND 2019-12-05  105  	if (ret)
0bc1767ab3eecd Franck LENORMAND 2019-12-05  106  		dev_err(dev, "Failed to read snvs dgo reg %d: %d\n", id, ret);
0bc1767ab3eecd Franck LENORMAND 2019-12-05  107  
0bc1767ab3eecd Franck LENORMAND 2019-12-05  108  	return ret;
0bc1767ab3eecd Franck LENORMAND 2019-12-05  109  }
0bc1767ab3eecd Franck LENORMAND 2019-12-05  110  

:::::: The code at line 35 was first introduced by commit
:::::: 0bc1767ab3eecd07b0d530e86997b01a358d6d64 SSI-87: soc: imx: secvio: Add support for SNVS secvio and tamper via SCFW

:::::: TO: Franck LENORMAND <franck.lenormand@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
