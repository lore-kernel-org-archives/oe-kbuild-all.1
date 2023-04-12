Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078572574
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681288265; x=1712824265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M7ZpL1YkDLswqXfO/vz0X/mgWI2gH4OkuhQ6bkQ5ma0=;
  b=Qy1kA2nJm+VjchYsi1/Kx0kL81USOtCt7gCUKlEU59l9Y4UBjcCG+yaC
   z/HJ10xPfukTC8ldgaeZRwOBwSkGTIKYGmexvvWCVDFb1UqxUByziVs9S
   SrdUe2dcDn0x0mD+B9imLealg7oDyK4J9DxhNfX/f6jdjTdNRb3+uFH8F
   kvait02tln+Y2MIPOdr9pfu+iYtzwcIcCw4Hq+5FNL4W8wa6KHfBCS4Hd
   ZvzDNvd7gixAI/syHgJbLsUBY+T/KICYCXldgeEZDLGg+ckX8UzWlAW5T
   81rE6EWuapk32YqywrkM+ajmQYcIh5rL2ntWgsa393rDF6f9Gpm0DQs39
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="342592713"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="342592713"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 01:31:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="1018667888"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="1018667888"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Apr 2023 01:31:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmVsc-000XWB-0y;
	Wed, 12 Apr 2023 08:31:02 +0000
Date: Wed, 12 Apr 2023 16:30:07 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 15/24]
 drivers/hid/dockchannel-hid/dockchannel-hid.c:856:44: warning: format '%ld'
 expects argument of type 'long int', but argument 4 has type 'unsigned int'
Message-ID: <202304121627.7lzdlxtA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   5bd8e50b4bbf53074e71cfe9cee1e70831d7573f
commit: 5e1fd4994fddb7721afdaf619b84fda97c16575c [15/24] hid: Add Apple DockChannel HID transport driver
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230412/202304121627.7lzdlxtA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/5e1fd4994fddb7721afdaf619b84fda97c16575c
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/090-spi-hid
        git checkout 5e1fd4994fddb7721afdaf619b84fda97c16575c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash drivers/hid/dockchannel-hid/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121627.7lzdlxtA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/dockchannel-hid/dockchannel-hid.c: In function 'dchid_request_gpio':
   drivers/hid/dockchannel-hid/dockchannel-hid.c:679:23: error: implicit declaration of function 'devm_gpiod_get_from_of_node'; did you mean 'devm_gpiod_get_array_optional'? [-Werror=implicit-function-declaration]
     679 |         iface->gpio = devm_gpiod_get_from_of_node(iface->dchid->dev,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       devm_gpiod_get_array_optional
   drivers/hid/dockchannel-hid/dockchannel-hid.c:679:21: warning: assignment to 'struct gpio_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     679 |         iface->gpio = devm_gpiod_get_from_of_node(iface->dchid->dev,
         |                     ^
   In file included from include/linux/device.h:15,
                    from drivers/hid/dockchannel-hid/dockchannel-hid.c:11:
   drivers/hid/dockchannel-hid/dockchannel-hid.c: In function 'dchid_handle_ack':
>> drivers/hid/dockchannel-hid/dockchannel-hid.c:856:44: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'unsigned int' [-Wformat=]
     856 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/hid/dockchannel-hid/dockchannel-hid.c:856:17: note: in expansion of macro 'dev_err'
     856 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                 ^~~~~~~
   drivers/hid/dockchannel-hid/dockchannel-hid.c:856:75: note: format string is defined here
     856 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                                                                         ~~^
         |                                                                           |
         |                                                                           long int
         |                                                                         %d
   drivers/hid/dockchannel-hid/dockchannel-hid.c: In function 'dockchannel_hid_probe':
   drivers/hid/dockchannel-hid/dockchannel-hid.c:992:32: error: implicit declaration of function 'gpiod_get_from_of_node'; did you mean 'get_dev_from_fwnode'? [-Werror=implicit-function-declaration]
     992 |                         gpio = gpiod_get_from_of_node(child, prop->name, 0, GPIOD_ASIS,
         |                                ^~~~~~~~~~~~~~~~~~~~~~
         |                                get_dev_from_fwnode
   drivers/hid/dockchannel-hid/dockchannel-hid.c:992:30: warning: assignment to 'struct gpio_desc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     992 |                         gpio = gpiod_get_from_of_node(child, prop->name, 0, GPIOD_ASIS,
         |                              ^
   cc1: some warnings being treated as errors


vim +856 drivers/hid/dockchannel-hid/dockchannel-hid.c

   849	
   850	static void dchid_handle_ack(struct dchid_iface *iface, struct dchid_hdr *hdr, void *data)
   851	{
   852		struct dchid_subhdr *shdr = (void *)data;
   853		u8 *payload = data + sizeof(*shdr);
   854	
   855		if (shdr->length + sizeof(*shdr) > hdr->length) {
 > 856			dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
   857				shdr->length, hdr->length - sizeof(*shdr));
   858			return;
   859		}
   860		if (shdr->flags != iface->out_flags) {
   861			dev_err(iface->dchid->dev,
   862				"Received unexpected flags 0x%x on ACK channel (expected 0x%x)\n",
   863				shdr->flags, iface->out_flags);
   864			return;
   865		}
   866	
   867		if (shdr->length < 1) {
   868			dev_err(iface->dchid->dev, "Received length 0 output report ack\n");
   869			return;
   870		}
   871		if (iface->tx_seq != hdr->seq) {
   872			dev_err(iface->dchid->dev, "Received ACK with bad seq (expected %d, got %d)\n",
   873				iface->rx_seq, hdr->seq);
   874			return;
   875		}
   876		if (iface->out_report != payload[0]) {
   877			dev_err(iface->dchid->dev, "Received ACK with bad report (expected %d, got %d\n",
   878				iface->out_report, payload[0]);
   879			return;
   880		}
   881	
   882		if (iface->resp_buf && iface->resp_size)
   883			memcpy(iface->resp_buf, payload + 1, min((size_t)shdr->length - 1, iface->resp_size));
   884	
   885		iface->resp_size = shdr->length;
   886		iface->out_report = -1;
   887		iface->retcode = shdr->retcode;
   888		complete(&iface->out_complete);
   889	}
   890	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
