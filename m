Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEBB1A08D6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 22:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719527955; cv=none; b=fwUvtOUekic5NSoBujgYeHZn97VEBGExhTJ7toZzWQgqBKuhjJPercgqvVOdNh8gbDXR1C14x7EQ6ZCmsgDhcyUH0cpllM03mvBNR9xaTXHmshcKkW5rEDiDr6kRBTIF5ThwvDYks+bLU5B/C+5sOHken/EzDciVNyiZwsNnZhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719527955; c=relaxed/simple;
	bh=Nu5yexGfS39nTcCDx0mDl40ejIViXqFA6rhrJNFQPuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cIRyA1wNnnT8HN6CbE+XzHG12OQU8gWPItIN0PTWIrrlnH3Loze+S/b8fcNcEYMmaMNDyqw87Eh45IZ05hidtEocFy1hnRty+mNr5tpf9zTd0o9Xo2nlp2OKhMBGYc+3xZPzl/k/y90Nw/sqQTWByhWTO+ecEpGA1PCffIzyUUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bp7twkdr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bp7twkdr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719527954; x=1751063954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nu5yexGfS39nTcCDx0mDl40ejIViXqFA6rhrJNFQPuc=;
  b=Bp7twkdrhIQbO5a+1tL1LHrVTqmVj3xeoYShkrKUAGeNKY50MvcNrO+4
   oh2n2kymTYo1vUGouCRFmjkVuxDmZXi7IQL3wFHrI1LMHbxKFvnv1Y0Ty
   bnJLG5FQ+wq7FovX9u46a1CgqIpYKqNu3Mfyp+QBTY38ZjacX1c0IwYaI
   pBy/Y3tBkGbswHJx0XMH11frIRVbWEuSTWi3hrylmjICaJassfuYHdBah
   9mlQjm9FKFtxnNdAw4PQ8VSCf5cnuNqS6XkX3zIp9oN6ChM0dX6b7eJgU
   IMezWigRn9+fp2DZx81QT8pmqY11C+59/HwINnO+r9KW7V8MzVmvPDEe/
   w==;
X-CSE-ConnectionGUID: zA8ZIe1eRU6ra5ttj7A+dQ==
X-CSE-MsgGUID: +mBZK5u4RkSjZrOeOE0EHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16833681"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="16833681"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 15:39:13 -0700
X-CSE-ConnectionGUID: xpRuByoiSeWN1A1vfHODBw==
X-CSE-MsgGUID: X4m8Ldo7TtCrXW3Gs3D/FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="49453922"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Jun 2024 15:39:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMxll-000GbA-0k;
	Thu, 27 Jun 2024 22:39:09 +0000
Date: Fri, 28 Jun 2024 06:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8744/9027] drivers/hid/hidraw.c:143:63: warning:
 cast from pointer to integer of different size
Message-ID: <202406280633.OPB5uIFj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   642a16ca7994a50d7de85715996a8ce171a5bdfb
commit: 67eccf151d76a9939ad8a50c6db5cb486b01df24 [8744/9027] HID: add source argument to HID low level functions
config: sh-buildonly-randconfig-r004-20220419 (https://download.01.org/0day-ci/archive/20240628/202406280633.OPB5uIFj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280633.OPB5uIFj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280633.OPB5uIFj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hidraw.c: In function 'hidraw_send_report':
>> drivers/hid/hidraw.c:143:63: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     143 |                 ret = __hid_hw_output_report(dev, buf, count, (__u64)file);
         |                                                               ^
   drivers/hid/hidraw.c:154:56: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     154 |                                    HID_REQ_SET_REPORT, (__u64)file);
         |                                                        ^
   drivers/hid/hidraw.c: In function 'hidraw_get_report':
   drivers/hid/hidraw.c:231:56: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     231 |                                    HID_REQ_GET_REPORT, (__u64)file);
         |                                                        ^


vim +143 drivers/hid/hidraw.c

   101	
   102	/*
   103	 * The first byte of the report buffer is expected to be a report number.
   104	 */
   105	static ssize_t hidraw_send_report(struct file *file, const char __user *buffer, size_t count, unsigned char report_type)
   106	{
   107		unsigned int minor = iminor(file_inode(file));
   108		struct hid_device *dev;
   109		__u8 *buf;
   110		int ret = 0;
   111	
   112		lockdep_assert_held(&minors_rwsem);
   113	
   114		if (!hidraw_table[minor] || !hidraw_table[minor]->exist) {
   115			ret = -ENODEV;
   116			goto out;
   117		}
   118	
   119		dev = hidraw_table[minor]->hid;
   120	
   121		if (count > HID_MAX_BUFFER_SIZE) {
   122			hid_warn(dev, "pid %d passed too large report\n",
   123				 task_pid_nr(current));
   124			ret = -EINVAL;
   125			goto out;
   126		}
   127	
   128		if (count < 2) {
   129			hid_warn(dev, "pid %d passed too short report\n",
   130				 task_pid_nr(current));
   131			ret = -EINVAL;
   132			goto out;
   133		}
   134	
   135		buf = memdup_user(buffer, count);
   136		if (IS_ERR(buf)) {
   137			ret = PTR_ERR(buf);
   138			goto out;
   139		}
   140	
   141		if ((report_type == HID_OUTPUT_REPORT) &&
   142		    !(dev->quirks & HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP)) {
 > 143			ret = __hid_hw_output_report(dev, buf, count, (__u64)file);
   144			/*
   145			 * compatibility with old implementation of USB-HID and I2C-HID:
   146			 * if the device does not support receiving output reports,
   147			 * on an interrupt endpoint, fallback to SET_REPORT HID command.
   148			 */
   149			if (ret != -ENOSYS)
   150				goto out_free;
   151		}
   152	
   153		ret = __hid_hw_raw_request(dev, buf[0], buf, count, report_type,
   154					   HID_REQ_SET_REPORT, (__u64)file);
   155	
   156	out_free:
   157		kfree(buf);
   158	out:
   159		return ret;
   160	}
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
