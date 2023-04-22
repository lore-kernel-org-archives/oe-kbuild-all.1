Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCEB33CC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 15:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682176009; x=1713712009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9h20B7mxugL6WmYVPFaBcnpJ1bMw8Ij2U9m5AyfvXxs=;
  b=Uxya3MQh8NMDnFm1NgmwaKP5BmEkOqRNXa4BfPr1yR/nVvcd4l6lX/dY
   +hGCxOxvUtnbykinqGVPFD0mAaiPSRJwHSIo6DvL1zS92qkGCcLOZYMuf
   sQmVZspW7qzpzSCdFkG1vt4SF4VbJZY7+O1Z9B1FctvUXjlu1XiUN3bQr
   U+jI8fuwTtkjTb6vpKHgLAHNs5sPtrlndqSEJ4EmCn+Xq2qxSDK/fsFd6
   Zu7Jd7h4Pe3vjZoG9hRu7YcyhYlLpT8RCoZUz3CuihTTW3eSPxUxR1xWz
   d7antt/xOb34AfSEOwa1fQWm6SBoH8Yy0j/uoZYIlntt6SrcqhbRl8JkA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="325763407"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="325763407"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 08:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="725154158"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="725154158"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Apr 2023 08:06:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqEp4-000hLq-14;
	Sat, 22 Apr 2023 15:06:46 +0000
Date: Sat, 22 Apr 2023 23:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Samaga Prasanna Krishna <samaga.krishna@intel.corp-partner.google.com>,
	Curtis Malainey <cujomalainey@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 3569/9999]
 sound/soc/sof/debug.c:57:9: sparse: sparse: cast removes address space
 '<asn:2>' of expression
Message-ID: <202304222205.9kDe1nRD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 71198ee91e6191cab28765e80aa3bb7e6b41d34a [3569/9999] CHROMIUM: ASoC: SOF: core fix sparse warnings.
config: m68k-randconfig-s051-20230416 (https://download.01.org/0day-ci/archive/20230422/202304222205.9kDe1nRD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/71198ee91e6191cab28765e80aa3bb7e6b41d34a
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout 71198ee91e6191cab28765e80aa3bb7e6b41d34a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash sound/soc/codecs/ sound/soc/sof/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304222205.9kDe1nRD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/sof/debug.c:57:9: sparse: sparse: cast removes address space '<asn:2>' of expression

vim +57 sound/soc/sof/debug.c

ed1d2896fb2fa3 Liam Girdwood 2018-01-08  31  
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  32  static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  33  				 size_t count, loff_t *ppos)
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  34  {
71198ee91e6191 Liam Girdwood 2018-07-05  35  	struct snd_sof_dfsentry_io *dfse = file->private_data;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  36  	struct snd_sof_dev *sdev = dfse->sdev;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  37  	int size;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  38  	u32 *buf;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  39  	loff_t pos = *ppos;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  40  	size_t ret;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  41  
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  42  	size = dfse->size;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  43  
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  44  	if (pos < 0)
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  45  		return -EINVAL;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  46  	if (pos >= size || !count)
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  47  		return 0;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  48  	if (count > size - pos)
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  49  		count = size - pos;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  50  
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  51  	size = (count + 3) & ~3;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  52  	buf = kzalloc(size, GFP_KERNEL);
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  53  	if (!buf)
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  54  		return -ENOMEM;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  55  
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  56  	pm_runtime_get(sdev->dev);
ed1d2896fb2fa3 Liam Girdwood 2018-01-08 @57  	memcpy_fromio(buf,  dfse->buf + pos, size);
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  58  	pm_runtime_put(sdev->dev);
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  59  
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  60  	ret = copy_to_user(buffer, buf, count);
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  61  	kfree(buf);
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  62  
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  63  	if (ret == count)
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  64  		return -EFAULT;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  65  	count -= ret;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  66  	*ppos = pos + count;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  67  
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  68  	return count;
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  69  }
ed1d2896fb2fa3 Liam Girdwood 2018-01-08  70  

:::::: The code at line 57 was first introduced by commit
:::::: ed1d2896fb2fa34d1efe8606af4bcee59afe807e FROMLIST: ASoC: SOF: Add driver debug support.

:::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
:::::: CC: chrome-bot <chrome-bot@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
