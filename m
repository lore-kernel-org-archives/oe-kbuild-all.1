Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB3C3220
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 12:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675688279; x=1707224279;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Aa+Bdjb5MhxekfbzKWP1+/MgI1EyThj/eUpG2SA5xx8=;
  b=XUkSezhwlgxPiDmhtAW+rpbS7N+OnOYZMEXWDa8wOMlbBkudMJuS/glh
   n6NIqNLIj+D8MOwhsBmOTBt+CuTnzcNR1PzZx8pJEdWSN+8OtP+wHoB1F
   h0r6VPe7aVl3w9NNFm8D4BFG00+7rKUb/v4B6WGNcBrjQEmNtonnuf5CI
   WGcsc4vV62am70i0tDyG9trdy0DGk2d6Ol2CZ5k3iDnJRpYfdqiNRUbtr
   Um1RKuzsZ8m0wXvi5YoMiopLoLeRNDWV94FN9J+0V8cQCG/KNrUMNau5X
   wD9IhG8x3EKXnqAplYwlER1K7kPN0V8tNACWJMKWP4tErHDNIQv7d1/Jo
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="331332431"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="331332431"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 04:57:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="755238391"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="755238391"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2023 04:57:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP14G-0002Xw-1B;
	Mon, 06 Feb 2023 12:57:56 +0000
Date: Mon, 6 Feb 2023 20:57:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [intel-lts:5.10/yocto 49/29177] drivers/usb/host/xhci.c:1338:15:
 warning: variable 'len' set but not used
Message-ID: <202302062021.zbr2VXUc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   a28867696061a1be54960089016434aee399da9d
commit: 78a15886681bd5f7ce8899884a9e25b8b44c32fd [49/29177] usb: xhci: Use temporary buffer to consolidate SG
config: i386-randconfig-a002-20230206 (https://download.01.org/0day-ci/archive/20230206/202302062021.zbr2VXUc-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/78a15886681bd5f7ce8899884a9e25b8b44c32fd
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout 78a15886681bd5f7ce8899884a9e25b8b44c32fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/crypto/ arch/x86/events/intel/ drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci.c:1338:15: warning: variable 'len' set but not used [-Wunused-but-set-variable]
           unsigned int len;
                        ^
   1 warning generated.


vim +/len +1338 drivers/usb/host/xhci.c

  1335	
  1336	static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
  1337	{
> 1338		unsigned int len;
  1339		unsigned int buf_len;
  1340		enum dma_data_direction dir;
  1341	
  1342		dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
  1343	
  1344		buf_len = urb->transfer_buffer_length;
  1345	
  1346		if (IS_ENABLED(CONFIG_HAS_DMA) &&
  1347		    (urb->transfer_flags & URB_DMA_MAP_SINGLE))
  1348			dma_unmap_single(hcd->self.sysdev,
  1349					 urb->transfer_dma,
  1350					 urb->transfer_buffer_length,
  1351					 dir);
  1352	
  1353		if (usb_urb_dir_in(urb))
  1354			len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
  1355						   urb->transfer_buffer,
  1356						   buf_len,
  1357						   0);
  1358	
  1359		urb->transfer_flags &= ~URB_DMA_MAP_SINGLE;
  1360		kfree(urb->transfer_buffer);
  1361		urb->transfer_buffer = NULL;
  1362	}
  1363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
