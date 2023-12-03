Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D7116438
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 22:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BaUW584Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701641183; x=1733177183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uXNasBvzRowqRRsmnni+ArdSWqNdLqDlDPW2xIBFSek=;
  b=BaUW584ZNPvYni3P5lmq94MSYUflHSNgKWIK6YCpKdaDnW/WzUHJLiDv
   2ErRbuC/kl8OI7LSKQuSpId3wo79XjiGBK1DSsQfVJ35KsIVC2fJfs/Q1
   y44WCGa+ljJBySAPwAcQFhyZnu/3oRhzUOqAjW47cgAl2pRcf8TVo9vfm
   dhdxD2hE0nZe5TgavIO82YFV1VyRyoJhLlvi1cF5Nz90n0qX3Q3Wsd8WJ
   QNQFSvCfkxumHAy1P5RYdVBqscn/V+imCtz6zaNtxkFkjK2Samsjbo4dy
   UvunRVsGzOhG25/aWqK/nyK6NaXs41fjHU2wy+LLORQtXnIhm4OgFUEiV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="563355"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="563355"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 14:06:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="799396610"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="799396610"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 03 Dec 2023 14:06:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9ubO-0007A2-2c;
	Sun, 03 Dec 2023 22:06:14 +0000
Date: Mon, 4 Dec 2023 06:05:52 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiri Kosina <jkosina@suse.cz>
Subject: drivers/hid/intel-ish-hid/ishtp-hid.c:208:24: sparse: sparse: cast
 to restricted __le16
Message-ID: <202312040545.PKPxVXOu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 0b28cb4bcb17dcb5fe0763fc3e1a94398b8f6cf6 HID: intel-ish-hid: ISH HID client driver
date:   7 years ago
config: x86_64-randconfig-123-20231101 (https://download.01.org/0day-ci/archive/20231204/202312040545.PKPxVXOu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231204/202312040545.PKPxVXOu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312040545.PKPxVXOu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/intel-ish-hid/ishtp-hid.c:208:24: sparse: sparse: cast to restricted __le16
   drivers/hid/intel-ish-hid/ishtp-hid.c:209:23: sparse: sparse: cast to restricted __le16
   drivers/hid/intel-ish-hid/ishtp-hid.c:210:24: sparse: sparse: cast to restricted __le16
   In file included from include/linux/kobject.h:21,
                    from include/linux/device.h:17,
                    from include/linux/input.h:22,
                    from include/linux/hid.h:35,
                    from drivers/hid/intel-ish-hid/ishtp-hid.c:16:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:517:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     517 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15,
                    from include/linux/kobject.h:21,
                    from include/linux/device.h:17,
                    from include/linux/input.h:22,
                    from include/linux/hid.h:35,
                    from drivers/hid/intel-ish-hid/ishtp-hid.c:16:
   include/linux/kernfs.h:440:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     440 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
   drivers/hid/intel-ish-hid/ishtp-hid.c: In function 'ishtp_hid_request':
   drivers/hid/intel-ish-hid/ishtp-hid.c:101:44: warning: pointer targets in passing argument 2 of 'hid_output_report' differ in signedness [-Wpointer-sign]
     101 |                 hid_output_report(rep, buf + header_size);
         |                                        ~~~~^~~~~~~~~~~~~
         |                                            |
         |                                            char *
   In file included from drivers/hid/intel-ish-hid/ishtp-hid.c:16:
   include/linux/hid.h:809:57: note: expected '__u8 *' {aka 'unsigned char *'} but argument is of type 'char *'
     809 | void hid_output_report(struct hid_report *report, __u8 *data);
         |                                                   ~~~~~~^~~~

vim +208 drivers/hid/intel-ish-hid/ishtp-hid.c

   168	
   169	/**
   170	 * ishtp_hid_probe() - hid register ll driver
   171	 * @cur_hid_dev:	Index of hid device calling to register
   172	 * @client_data:	Client data pointer
   173	 *
   174	 * This function is used to allocate and add HID device.
   175	 *
   176	 * Return: 0 on success, non zero on error
   177	 */
   178	int ishtp_hid_probe(unsigned int cur_hid_dev,
   179			    struct ishtp_cl_data *client_data)
   180	{
   181		int rv;
   182		struct hid_device *hid;
   183		struct ishtp_hid_data *hid_data;
   184	
   185		hid = hid_allocate_device();
   186		if (IS_ERR(hid)) {
   187			rv = PTR_ERR(hid);
   188			return	-ENOMEM;
   189		}
   190	
   191		hid_data = kzalloc(sizeof(*hid_data), GFP_KERNEL);
   192		if (!hid_data) {
   193			rv = -ENOMEM;
   194			goto err_hid_data;
   195		}
   196	
   197		hid_data->index = cur_hid_dev;
   198		hid_data->client_data = client_data;
   199		init_waitqueue_head(&hid_data->hid_wait);
   200	
   201		hid->driver_data = hid_data;
   202	
   203		client_data->hid_sensor_hubs[cur_hid_dev] = hid;
   204	
   205		hid->ll_driver = &ishtp_hid_ll_driver;
   206		hid->bus = BUS_INTEL_ISHTP;
   207		hid->dev.parent = &client_data->cl_device->dev;
 > 208		hid->version = le16_to_cpu(ISH_HID_VERSION);
   209		hid->vendor = le16_to_cpu(ISH_HID_VENDOR);
   210		hid->product = le16_to_cpu(ISH_HID_PRODUCT);
   211		snprintf(hid->name, sizeof(hid->name), "%s %04hX:%04hX", "hid-ishtp",
   212			hid->vendor, hid->product);
   213	
   214		rv = hid_add_device(hid);
   215		if (rv)
   216			goto err_hid_device;
   217	
   218		hid_ishtp_trace(client_data,  "%s allocated hid %p\n", __func__, hid);
   219	
   220		return 0;
   221	
   222	err_hid_device:
   223		kfree(hid_data);
   224	err_hid_data:
   225		kfree(hid);
   226		return rv;
   227	}
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
