Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CBA2909
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 13:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682688276; x=1714224276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t3jqbHPKxzKfgR0QLqQ+5mNQBC8LogKZvGiYb3Dbyr8=;
  b=HHgT8xTNrREcafRoO42Cae5LWh3DrGKAeElDlOp8Cb/9olykMni4fEd3
   ++1knARzbSUahV5KyjzurBBa5g3r4hf/kpGlNssGvJUyqcXGGVZ0XdA/6
   Jk2H9u0vXnH+88X8MjRaQRg0gv1TsvoPg2MVvfl73M6jcen+kVTDHuo2d
   oiHnS9PAFX9xilkXHFBmWZEcyRr4TRWl6jlppUU3jqR7VCeudReXMZS6q
   dc+dB0rhmdPjr71oCsqsFlhP4VNEeNNlbDOmQ5xkT2SfTyQNaU3fHZ4Od
   Rx8Pr62O54E7C/mL9YCHXL2x7AbMMRZO7CrSsX8WnwRe9lz/+rBMyWS17
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="347769106"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="347769106"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 06:24:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="819010532"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="819010532"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Apr 2023 06:24:33 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psO5R-0000SD-0w;
	Fri, 28 Apr 2023 13:24:33 +0000
Date: Fri, 28 Apr 2023 21:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Richert <krzysztof.richert@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 1/1] net: mctp: MCTP VDM extension
Message-ID: <202304282145.fCBnJNDV-lkp@intel.com>
References: <20230425090748.2380222-2-krzysztof.richert@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425090748.2380222-2-krzysztof.richert@intel.com>

Hi Krzysztof,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main linus/master v6.3 next-20230427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Richert/net-mctp-MCTP-VDM-extension/20230425-171027
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230425090748.2380222-2-krzysztof.richert%40intel.com
patch subject: [RFC PATCH v1 1/1] net: mctp: MCTP VDM extension
config: sparc-randconfig-s032-20230427 (https://download.01.org/0day-ci/archive/20230428/202304282145.fCBnJNDV-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/e9071a679005391fa75adb12a655b002b2c4e408
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Richert/net-mctp-MCTP-VDM-extension/20230425-171027
        git checkout e9071a679005391fa75adb12a655b002b2c4e408
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc SHELL=/bin/bash net/mctp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304282145.fCBnJNDV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/mctp/af_mctp.c:65:47: sparse: sparse: cast to restricted __be16
>> net/mctp/af_mctp.c:75:45: sparse: sparse: cast to restricted __be32
>> net/mctp/af_mctp.c:97:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   net/mctp/af_mctp.c:97:41: sparse:     expected unsigned short [usertype]
   net/mctp/af_mctp.c:97:41: sparse:     got restricted __be16 [usertype]
>> net/mctp/af_mctp.c:99:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   net/mctp/af_mctp.c:99:41: sparse:     expected unsigned int [usertype]
   net/mctp/af_mctp.c:99:41: sparse:     got restricted __be32 [usertype]

vim +65 net/mctp/af_mctp.c

    56	
    57	int mctp_vendor_define_message_decode(struct sk_buff *skb, u8 type,
    58					      struct mctp_vdm_data *vdm_data, u8 *vendorlen)
    59	{
    60		union mctp_vendor_id vendorid;
    61		u8 len = 0;
    62		int rc = 0;
    63	
    64		if (mctp_pci_vdm(type)) {
  > 65			vendorid.pci_vendor_id.data = ntohs(*((u16 *)((u8 *)skb->data + 1)));
    66			len = 2;
    67			switch (vendorid.pci_vendor_id.data) {
    68			case PCI_VENDOR_ID_INTEL:
    69				vdm_data->smctp_sub_type = *((u8 *)skb->data + 4);
    70				break;
    71			default:
    72				rc = -EPERM;
    73			}
    74		} else if (mctp_iana_vdm(type)) {
  > 75			vendorid.iana_number.data = ntohl(*((u32 *)((u8 *)skb->data + 1)));
    76			len = 4;
    77			/* TODO: no VDM based on IANA support - add if needed for specific vendor */
    78			rc = -EPERM;
    79		} else {
    80			rc = -EINVAL;
    81		}
    82	
    83		if (rc == 0) {
    84			vdm_data->smctp_vendor = vendorid;
    85	
    86			if (vendorlen)
    87				*vendorlen = len;
    88		}
    89	
    90		return rc;
    91	}
    92	
    93	static int mctp_vendor_define_message_encode(struct sk_buff *skb, u8 type,
    94						     struct mctp_vdm_data *vdm_data)
    95	{
    96		if (mctp_pci_vdm(type))
  > 97			*(u16 *)skb_put(skb, 2) = htons(vdm_data->smctp_vendor.pci_vendor_id.data);
    98		else if (mctp_iana_vdm(type))
  > 99			*(u32 *)skb_put(skb, 4) = htonl(vdm_data->smctp_vendor.iana_number.data);
   100		else
   101			return -EINVAL;
   102	
   103		return 0;
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
