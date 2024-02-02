Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540F417CF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706879526; cv=none; b=pkUqKJz2zKXz6oDqX++UPrtVwHubXnmGyJWAVwW15C4AF6DOLuAub5emy+Caa1SECkwM/L5inHxioNRARyvhjKLUcgDkY9VGZ2qBbG22CqRvZ7VYRbWuxrQr1HFBsiL2SvUNWCfaS1JWtMzx+AW+0gyamUfdu2pfHU1/2pwdynE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706879526; c=relaxed/simple;
	bh=iL65ZA8lKAw6KJwb+U7woNRJ8FN8ZGuYVYcABwgU/jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Od0GOoEz+qa/0socfBupt8+g6Vv2dhx359YHjvsCH6ll7NgDQfoCUAy0EBKea0gfLzfO372FwcTMe8IcebNNa7DsD4DdmlllpnLOHh85MYgS5Hpm3W+wwYqVHLej4Qz5X8KQTxlxpjrvsNbUYpTh1AeJm6iXsGz1aXgYdyxEVh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtIsFr3M; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtIsFr3M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706879524; x=1738415524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iL65ZA8lKAw6KJwb+U7woNRJ8FN8ZGuYVYcABwgU/jQ=;
  b=NtIsFr3MXSJgqfwWETnpBOfUtEuFAh00WX4xcW+GVL3S8mbJ3Sk+n4UM
   FJLj1tmmKcN3lJnhu2DZ0CTyO3UB0Mi4Lhj9FDKhmaLUv2BB+y5u2yhfq
   5Hj9YzdmfDD/j8nr72Yshkkpk3yrXh8Pslzu/ytlmC38YxFAQPaYkT1mV
   ebN81HVl6rITSMOECxUiq0IRrpnbDXCC2bzNhAVY/60GU6EqZTES26E4k
   +xIlCIO6hEc8tMf/ZkvwzNEs7PwRJ4SglBhx5Baegp81QwlUvB0FpdwBv
   ELx87uXTDSkxsdPXdsMwXBjijGuVd22sQ13WmA4WtY/1nuRtU4KrH2Mn7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="73049"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="73049"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 05:12:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="908568905"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="908568905"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2024 05:12:01 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVtKp-0003rV-1m;
	Fri, 02 Feb 2024 13:11:59 +0000
Date: Fri, 2 Feb 2024 21:11:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kah Jing Lee <kah.jing.lee@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>
Subject: [dinguyen:socfpga_dts_for_v6.9 2/2]
 drivers/firmware/stratix10-rsu.c:116: warning: Function parameter or struct
 member 'device_info' not described in 'stratix10_rsu_priv'
Message-ID: <202402022132.NJa3M6jE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_dts_for_v6.9
head:   7dc2077fe6e1e18f7d874e9a0a9eaae081b8d32c
commit: 7dc2077fe6e1e18f7d874e9a0a9eaae081b8d32c [2/2] drivers: firmware: stratix10-rsu: Query device info
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240202/202402022132.NJa3M6jE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240202/202402022132.NJa3M6jE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402022132.NJa3M6jE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/stratix10-rsu.c:116: warning: Function parameter or struct member 'status' not described in 'stratix10_rsu_priv'
   drivers/firmware/stratix10-rsu.c:116: warning: Function parameter or struct member 'dcmf_version' not described in 'stratix10_rsu_priv'
   drivers/firmware/stratix10-rsu.c:116: warning: Function parameter or struct member 'dcmf_status' not described in 'stratix10_rsu_priv'
>> drivers/firmware/stratix10-rsu.c:116: warning: Function parameter or struct member 'device_info' not described in 'stratix10_rsu_priv'
>> drivers/firmware/stratix10-rsu.c:116: warning: Excess struct member 'device_info.size' description in 'stratix10_rsu_priv'
>> drivers/firmware/stratix10-rsu.c:116: warning: Excess struct member 'device_info.erase_size' description in 'stratix10_rsu_priv'


vim +116 drivers/firmware/stratix10-rsu.c

7dc2077fe6e1e1 Kah Jing Lee 2024-02-01   48  
4526ebbc77732b Richard Gong 2019-09-03   49  typedef void (*rsu_callback)(struct stratix10_svc_client *client,
4526ebbc77732b Richard Gong 2019-09-03   50  			     struct stratix10_svc_cb_data *data);
4526ebbc77732b Richard Gong 2019-09-03   51  /**
4526ebbc77732b Richard Gong 2019-09-03   52   * struct stratix10_rsu_priv - rsu data structure
4526ebbc77732b Richard Gong 2019-09-03   53   * @chan: pointer to the allocated service channel
4526ebbc77732b Richard Gong 2019-09-03   54   * @client: active service client
4526ebbc77732b Richard Gong 2019-09-03   55   * @completion: state for callback completion
4526ebbc77732b Richard Gong 2019-09-03   56   * @lock: a mutex to protect callback completion state
4526ebbc77732b Richard Gong 2019-09-03   57   * @status.current_image: address of image currently running in flash
4526ebbc77732b Richard Gong 2019-09-03   58   * @status.fail_image: address of failed image in flash
75bc73fc0188ef Richard Gong 2020-06-15   59   * @status.version: the interface version number of RSU firmware
4526ebbc77732b Richard Gong 2019-09-03   60   * @status.state: the state of RSU system
4526ebbc77732b Richard Gong 2019-09-03   61   * @status.error_details: error code
4526ebbc77732b Richard Gong 2019-09-03   62   * @status.error_location: the error offset inside the image that failed
75bc73fc0188ef Richard Gong 2020-06-15   63   * @dcmf_version.dcmf0: Quartus dcmf0 version
75bc73fc0188ef Richard Gong 2020-06-15   64   * @dcmf_version.dcmf1: Quartus dcmf1 version
75bc73fc0188ef Richard Gong 2020-06-15   65   * @dcmf_version.dcmf2: Quartus dcmf2 version
75bc73fc0188ef Richard Gong 2020-06-15   66   * @dcmf_version.dcmf3: Quartus dcmf3 version
4a6c8c565db1d0 Kah Jing Lee 2022-07-11   67   * @dcmf_status.dcmf0: dcmf0 status
4a6c8c565db1d0 Kah Jing Lee 2022-07-11   68   * @dcmf_status.dcmf1: dcmf1 status
4a6c8c565db1d0 Kah Jing Lee 2022-07-11   69   * @dcmf_status.dcmf2: dcmf2 status
4a6c8c565db1d0 Kah Jing Lee 2022-07-11   70   * @dcmf_status.dcmf3: dcmf3 status
7dc2077fe6e1e1 Kah Jing Lee 2024-02-01   71   * @device_info.size: flash size
7dc2077fe6e1e1 Kah Jing Lee 2024-02-01   72   * @device_info.erase_size: flash erase size
4526ebbc77732b Richard Gong 2019-09-03   73   * @retry_counter: the current image's retry counter
75bc73fc0188ef Richard Gong 2020-06-15   74   * @max_retry: the preset max retry value
abe8ff435fb613 Radu Bacrau  2023-07-27   75   * @spt0_address: address of spt0
abe8ff435fb613 Radu Bacrau  2023-07-27   76   * @spt1_address: address of spt1
abe8ff435fb613 Radu Bacrau  2023-07-27   77   * @get_spt_response_buf: response from sdm for get_spt command
4526ebbc77732b Richard Gong 2019-09-03   78   */
4526ebbc77732b Richard Gong 2019-09-03   79  struct stratix10_rsu_priv {
4526ebbc77732b Richard Gong 2019-09-03   80  	struct stratix10_svc_chan *chan;
4526ebbc77732b Richard Gong 2019-09-03   81  	struct stratix10_svc_client client;
4526ebbc77732b Richard Gong 2019-09-03   82  	struct completion completion;
4526ebbc77732b Richard Gong 2019-09-03   83  	struct mutex lock;
4526ebbc77732b Richard Gong 2019-09-03   84  	struct {
4526ebbc77732b Richard Gong 2019-09-03   85  		unsigned long current_image;
4526ebbc77732b Richard Gong 2019-09-03   86  		unsigned long fail_image;
4526ebbc77732b Richard Gong 2019-09-03   87  		unsigned int version;
4526ebbc77732b Richard Gong 2019-09-03   88  		unsigned int state;
4526ebbc77732b Richard Gong 2019-09-03   89  		unsigned int error_details;
4526ebbc77732b Richard Gong 2019-09-03   90  		unsigned int error_location;
4526ebbc77732b Richard Gong 2019-09-03   91  	} status;
75bc73fc0188ef Richard Gong 2020-06-15   92  
75bc73fc0188ef Richard Gong 2020-06-15   93  	struct {
75bc73fc0188ef Richard Gong 2020-06-15   94  		unsigned int dcmf0;
75bc73fc0188ef Richard Gong 2020-06-15   95  		unsigned int dcmf1;
75bc73fc0188ef Richard Gong 2020-06-15   96  		unsigned int dcmf2;
75bc73fc0188ef Richard Gong 2020-06-15   97  		unsigned int dcmf3;
75bc73fc0188ef Richard Gong 2020-06-15   98  	} dcmf_version;
75bc73fc0188ef Richard Gong 2020-06-15   99  
4a6c8c565db1d0 Kah Jing Lee 2022-07-11  100  	struct {
4a6c8c565db1d0 Kah Jing Lee 2022-07-11  101  		unsigned int dcmf0;
4a6c8c565db1d0 Kah Jing Lee 2022-07-11  102  		unsigned int dcmf1;
4a6c8c565db1d0 Kah Jing Lee 2022-07-11  103  		unsigned int dcmf2;
4a6c8c565db1d0 Kah Jing Lee 2022-07-11  104  		unsigned int dcmf3;
4a6c8c565db1d0 Kah Jing Lee 2022-07-11  105  	} dcmf_status;
4a6c8c565db1d0 Kah Jing Lee 2022-07-11  106  
7dc2077fe6e1e1 Kah Jing Lee 2024-02-01  107  	struct flash_device_info device_info[4];
7dc2077fe6e1e1 Kah Jing Lee 2024-02-01  108  
4526ebbc77732b Richard Gong 2019-09-03  109  	unsigned int retry_counter;
75bc73fc0188ef Richard Gong 2020-06-15  110  	unsigned int max_retry;
abe8ff435fb613 Radu Bacrau  2023-07-27  111  
abe8ff435fb613 Radu Bacrau  2023-07-27  112  	unsigned long spt0_address;
abe8ff435fb613 Radu Bacrau  2023-07-27  113  	unsigned long spt1_address;
abe8ff435fb613 Radu Bacrau  2023-07-27  114  
abe8ff435fb613 Radu Bacrau  2023-07-27  115  	unsigned int *get_spt_response_buf;
4526ebbc77732b Richard Gong 2019-09-03 @116  };
4526ebbc77732b Richard Gong 2019-09-03  117  

:::::: The code at line 116 was first introduced by commit
:::::: 4526ebbc77732bcae965ee374cf3e8d86436b2ad firmware: add Intel Stratix10 remote system update driver

:::::: TO: Richard Gong <richard.gong@intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
