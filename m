Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9659279EF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 19:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677524614; x=1709060614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cfja8yb7AbdaJsxf63P/Zj2bFfGNjYkaKXOd4gIvzcQ=;
  b=ISDhTM3iIB3IqlCb1WeU4vJgzExBFngd6t9sbZeDSJ6JgIpxsNnEuozV
   /zYwR+KCCCFjVkq/0nIzmxH/Laxgfwyqba5ggfA43FrZXnxej07Uccpqs
   gY994MFEPMdnr9beflRRIu35zkC1n0o5MIoh85keZw+tUADxiP9le8+R8
   AD7ibgtCHWUzTpJ3nMwsfagVKgGr88eNPQnnoxfcKD+td17DfT+YQwsGS
   0GmTw6RwojD4L0p/puGPA/gmstv9AP+WIua4qAhteKrPCKnndp3wwRk8o
   WhPYDpoqfHGqlmcr2CVyoYnf+ULRTlDM8NVMPSizGsjvSlaMRLMR/1jjo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="313613230"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="313613230"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 11:02:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="737842181"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="737842181"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Feb 2023 11:02:56 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWilz-0004hc-1m;
	Mon, 27 Feb 2023 19:02:55 +0000
Date: Tue, 28 Feb 2023 03:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/6] yenta_socket: copy pccard core code into driver
Message-ID: <202302280244.YensTdvb-lkp@intel.com>
References: <20230227133457.431729-4-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227133457.431729-4-arnd@kernel.org>

Hi Arnd,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus soc/for-next linus/master v6.2 next-20230227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/pccard-remove-bcm63xx-socket-driver/20230227-213913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230227133457.431729-4-arnd%40kernel.org
patch subject: [RFC 3/6] yenta_socket: copy pccard core code into driver
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230228/202302280244.YensTdvb-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/34b7367024292e3954b6dcb4f1e126ed0da3f7c1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Arnd-Bergmann/pccard-remove-bcm63xx-socket-driver/20230227-213913
        git checkout 34b7367024292e3954b6dcb4f1e126ed0da3f7c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280244.YensTdvb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pcmcia/yenta_socket.c:1328:5: warning: no previous prototype for 'pcmcia_reset_card' [-Wmissing-prototypes]
    1328 | int pcmcia_reset_card(struct pcmcia_socket *skt)
         |     ^~~~~~~~~~~~~~~~~
--
>> drivers/pcmcia/yenta_socket.c:3576: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * EnE specific part. EnE bridges are register compatible with TI bridges but


vim +/pcmcia_reset_card +1328 drivers/pcmcia/yenta_socket.c

  1321	
  1322	
  1323	/* I'm not sure which "reset" function this is supposed to use,
  1324	 * but for now, it uses the low-level interface's reset, not the
  1325	 * CIS register.
  1326	 */
  1327	
> 1328	int pcmcia_reset_card(struct pcmcia_socket *skt)
  1329	{
  1330		int ret;
  1331	
  1332		dev_dbg(&skt->dev, "resetting socket\n");
  1333	
  1334		mutex_lock(&skt->skt_mutex);
  1335		do {
  1336			if (!(skt->state & SOCKET_PRESENT)) {
  1337				dev_dbg(&skt->dev, "can't reset, not present\n");
  1338				ret = -ENODEV;
  1339				break;
  1340			}
  1341			if (skt->state & SOCKET_SUSPEND) {
  1342				dev_dbg(&skt->dev, "can't reset, suspended\n");
  1343				ret = -EBUSY;
  1344				break;
  1345			}
  1346			if (skt->state & SOCKET_CARDBUS) {
  1347				dev_dbg(&skt->dev, "can't reset, is cardbus\n");
  1348				ret = -EPERM;
  1349				break;
  1350			}
  1351	
  1352			if (skt->callback)
  1353				skt->callback->suspend(skt);
  1354			mutex_lock(&skt->ops_mutex);
  1355			ret = socket_reset(skt);
  1356			mutex_unlock(&skt->ops_mutex);
  1357			if ((ret == 0) && (skt->callback))
  1358				skt->callback->resume(skt);
  1359	
  1360			ret = 0;
  1361		} while (0);
  1362		mutex_unlock(&skt->skt_mutex);
  1363	
  1364		return ret;
  1365	} /* reset_card */
  1366	EXPORT_SYMBOL(pcmcia_reset_card);
  1367	
  1368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
