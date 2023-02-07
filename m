Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0240B23AA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 11:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675769881; x=1707305881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=csIN9Lv3LAreFTCA+Qa2/KAShx5y2v7DH8eD/1nbPDw=;
  b=abma7BbytzaBTBVt8AWRFRNe/WacA5vAz/4C8vB8pv20VDgBIqry1d5d
   L7CIqELP3JOJR3BtuHKWFnuwf31jAqGJQ9chTstnMEcWFWUIppPtEEI97
   XXU09Ex1zAaDOMiKm/8fKSSL2F1udxbHIsinfUPBTGZg+A3imreDziudp
   2n1pGCwKhL+moJ52szs7F/W3YPDJppaL8fquisiE61tPfqDb21/t4kLok
   +eTwgYSg1AkalqpR4XSC3YttpmhYC9eqgUA5L87XofZkOkjplrWppRXJr
   rOPrBu6wKPJxjxkP8Ag8GFcQLOiAlbGE+AvCcAbTFJouKTHEk5B2e7Ki6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="329502047"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="329502047"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 03:38:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="995698714"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="995698714"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Feb 2023 03:37:59 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPMIQ-0003VW-1y;
	Tue, 07 Feb 2023 11:37:58 +0000
Date: Tue, 7 Feb 2023 19:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 34/39] drivers/usb/gadget/configfs.c:824:13:
 warning: variable 'ret' set but not used
Message-ID: <202302071942.wrmMMxiA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   cf13d6e4a9aa6639c173fd630d82d586a2322ff9
commit: 15a7cf8caabee4613764abe7814dd3162cb64137 [34/39] usb: gadget: configfs: Support arbitrary string descriptors
config: arm64-buildonly-randconfig-r002-20230207 (https://download.01.org/0day-ci/archive/20230207/202302071942.wrmMMxiA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=15a7cf8caabee4613764abe7814dd3162cb64137
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout 15a7cf8caabee4613764abe7814dd3162cb64137
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/usb/gadget/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/configfs.c: In function 'gadget_string_s_store':
>> drivers/usb/gadget/configfs.c:824:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     824 |         int ret;
         |             ^~~


vim +/ret +824 drivers/usb/gadget/configfs.c

   818	
   819	static ssize_t gadget_string_s_store(struct config_item *item, const char *page,
   820					     size_t len)
   821	{
   822		struct gadget_string *string = to_gadget_string(item);
   823		int size = min(sizeof(string->string), len + 1);
 > 824		int ret;
   825	
   826		if (len > USB_MAX_STRING_LEN)
   827			return -EINVAL;
   828	
   829		ret = strscpy(string->string, page, size);
   830		return len;
   831	}
   832	CONFIGFS_ATTR(gadget_string_, s);
   833	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
