Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039F439E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 04:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685940524; x=1717476524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=98pdvSINUbawiUjSHJxYJ8bhrHjFVnYyicb+/FJ4k8c=;
  b=ksDVGQLKkdgXic1fX3BSw8Ku331YRa5Xk5a/OtVaVIepwAdrdcctRxtm
   zUk0v3mHTHig6KMPCcJY3a0puEzXUL94ODL05Vpoozmwm5QcQMqKHkE+F
   WHXC/o0sKYQA1Se5bhC5o1mUM3sxGHDlhTQTKjGVoeyh9eeh5vwG8lDKc
   7zUI/9b36/TAB65lOMILBBE+uN1cljZbedZoitW7WJ6H/lbjIqDxgpZSj
   00ez+kGOn8oX66Ye4+rYpUfzhqECnQyXRezFj0dfLNeOKzGql8hHGdV3f
   O/YKqSP/LeyALm5rCfsjpSDyrB/KmE650ZhSfCut78qLLAgfUeQFsd4M2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="345873286"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="345873286"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 21:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="778401622"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="778401622"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jun 2023 21:48:42 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6293-0003qp-28;
	Mon, 05 Jun 2023 04:48:41 +0000
Date: Mon, 5 Jun 2023 12:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: Junfeng Guo <junfeng.guo@intel.com>, intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev, qi.z.zhang@intel.com
Subject: Re: [Intel-wired-lan] [PATCH iwl-next 12/15] ice: add parser
 execution main loop
Message-ID: <202306051246.jce5ySQm-lkp@intel.com>
References: <20230605022920.2361266-13-junfeng.guo@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605022920.2361266-13-junfeng.guo@intel.com>

Hi Junfeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-next-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Junfeng-Guo/ice-add-parser-create-and-destroy-skeleton/20230605-103239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230605022920.2361266-13-junfeng.guo%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next 12/15] ice: add parser execution main loop
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230605/202306051246.jce5ySQm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/fae2352266c3690faee3dbf4ba724c8d28a0873d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Junfeng-Guo/ice-add-parser-create-and-destroy-skeleton/20230605-103239
        git checkout fae2352266c3690faee3dbf4ba724c8d28a0873d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/intel/ice/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306051246.jce5ySQm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_parser.c: In function 'ice_parser_sect_item_get':
>> drivers/net/ethernet/intel/ice/ice_parser.c:98:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      98 |         return (void *)((u64)section + data_off + index * size);
         |                         ^
>> drivers/net/ethernet/intel/ice/ice_parser.c:98:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      98 |         return (void *)((u64)section + data_off + index * size);
         |                ^
   drivers/net/ethernet/intel/ice/ice_parser.c: In function 'ice_parser_create_table':
   drivers/net/ethernet/intel/ice/ice_parser.c:149:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     149 |                                    (void *)((u64)table + idx * item_size),
         |                                             ^
   drivers/net/ethernet/intel/ice/ice_parser.c:149:36: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     149 |                                    (void *)((u64)table + idx * item_size),
         |                                    ^


vim +98 drivers/net/ethernet/intel/ice/ice_parser.c

6f877e25596c20 Junfeng Guo 2023-06-05   34  
6f877e25596c20 Junfeng Guo 2023-06-05   35  /**
6f877e25596c20 Junfeng Guo 2023-06-05   36   * ice_parser_sect_item_get - parse a item from a section
6f877e25596c20 Junfeng Guo 2023-06-05   37   * @sect_type: section type
6f877e25596c20 Junfeng Guo 2023-06-05   38   * @section: section object
6f877e25596c20 Junfeng Guo 2023-06-05   39   * @index: index of the item to get
6f877e25596c20 Junfeng Guo 2023-06-05   40   * @offset: dummy as prototype of ice_pkg_enum_entry's last parameter
6f877e25596c20 Junfeng Guo 2023-06-05   41   */
6f877e25596c20 Junfeng Guo 2023-06-05   42  void *ice_parser_sect_item_get(u32 sect_type, void *section,
6f877e25596c20 Junfeng Guo 2023-06-05   43  			       u32 index, u32 *offset)
6f877e25596c20 Junfeng Guo 2023-06-05   44  {
6f877e25596c20 Junfeng Guo 2023-06-05   45  	struct ice_pkg_sect_hdr *hdr;
6f877e25596c20 Junfeng Guo 2023-06-05   46  	int data_off = ICE_SEC_DATA_OFFSET;
6f877e25596c20 Junfeng Guo 2023-06-05   47  	int size;
6f877e25596c20 Junfeng Guo 2023-06-05   48  
6f877e25596c20 Junfeng Guo 2023-06-05   49  	if (!section)
6f877e25596c20 Junfeng Guo 2023-06-05   50  		return NULL;
6f877e25596c20 Junfeng Guo 2023-06-05   51  
6f877e25596c20 Junfeng Guo 2023-06-05   52  	switch (sect_type) {
6f877e25596c20 Junfeng Guo 2023-06-05   53  	case ICE_SID_RXPARSER_IMEM:
6f877e25596c20 Junfeng Guo 2023-06-05   54  		size = ICE_SID_RXPARSER_IMEM_ENTRY_SIZE;
6f877e25596c20 Junfeng Guo 2023-06-05   55  		break;
5457ae16bc58a7 Junfeng Guo 2023-06-05   56  	case ICE_SID_RXPARSER_METADATA_INIT:
5457ae16bc58a7 Junfeng Guo 2023-06-05   57  		size = ICE_SID_RXPARSER_METADATA_INIT_ENTRY_SIZE;
5457ae16bc58a7 Junfeng Guo 2023-06-05   58  		break;
6f3e94c8184aa1 Junfeng Guo 2023-06-05   59  	case ICE_SID_RXPARSER_CAM:
6f3e94c8184aa1 Junfeng Guo 2023-06-05   60  		size = ICE_SID_RXPARSER_CAM_ENTRY_SIZE;
6f3e94c8184aa1 Junfeng Guo 2023-06-05   61  		break;
6f3e94c8184aa1 Junfeng Guo 2023-06-05   62  	case ICE_SID_RXPARSER_PG_SPILL:
6f3e94c8184aa1 Junfeng Guo 2023-06-05   63  		size = ICE_SID_RXPARSER_PG_SPILL_ENTRY_SIZE;
6f3e94c8184aa1 Junfeng Guo 2023-06-05   64  		break;
6f3e94c8184aa1 Junfeng Guo 2023-06-05   65  	case ICE_SID_RXPARSER_NOMATCH_CAM:
6f3e94c8184aa1 Junfeng Guo 2023-06-05   66  		size = ICE_SID_RXPARSER_NOMATCH_CAM_ENTRY_SIZE;
6f3e94c8184aa1 Junfeng Guo 2023-06-05   67  		break;
6f3e94c8184aa1 Junfeng Guo 2023-06-05   68  	case ICE_SID_RXPARSER_NOMATCH_SPILL:
6f3e94c8184aa1 Junfeng Guo 2023-06-05   69  		size = ICE_SID_RXPARSER_NOMATCH_SPILL_ENTRY_SIZE;
6f3e94c8184aa1 Junfeng Guo 2023-06-05   70  		break;
017f2b17c37285 Junfeng Guo 2023-06-05   71  	case ICE_SID_RXPARSER_BOOST_TCAM:
017f2b17c37285 Junfeng Guo 2023-06-05   72  		size = ICE_SID_RXPARSER_BOOST_TCAM_ENTRY_SIZE;
017f2b17c37285 Junfeng Guo 2023-06-05   73  		break;
017f2b17c37285 Junfeng Guo 2023-06-05   74  	case ICE_SID_LBL_RXPARSER_TMEM:
017f2b17c37285 Junfeng Guo 2023-06-05   75  		data_off = ICE_SEC_LBL_DATA_OFFSET;
017f2b17c37285 Junfeng Guo 2023-06-05   76  		size = ICE_SID_LBL_ENTRY_SIZE;
017f2b17c37285 Junfeng Guo 2023-06-05   77  		break;
661125652a34c2 Junfeng Guo 2023-06-05   78  	case ICE_SID_RXPARSER_MARKER_PTYPE:
661125652a34c2 Junfeng Guo 2023-06-05   79  		size = ICE_SID_RXPARSER_MARKER_TYPE_ENTRY_SIZE;
661125652a34c2 Junfeng Guo 2023-06-05   80  		break;
7245e027d57290 Junfeng Guo 2023-06-05   81  	case ICE_SID_RXPARSER_MARKER_GRP:
7245e027d57290 Junfeng Guo 2023-06-05   82  		size = ICE_SID_RXPARSER_MARKER_GRP_ENTRY_SIZE;
7245e027d57290 Junfeng Guo 2023-06-05   83  		break;
7245e027d57290 Junfeng Guo 2023-06-05   84  	case ICE_SID_RXPARSER_PROTO_GRP:
7245e027d57290 Junfeng Guo 2023-06-05   85  		size = ICE_SID_RXPARSER_PROTO_GRP_ENTRY_SIZE;
7245e027d57290 Junfeng Guo 2023-06-05   86  		break;
a4e7ee58c72b52 Junfeng Guo 2023-06-05   87  	case ICE_SID_RXPARSER_FLAG_REDIR:
a4e7ee58c72b52 Junfeng Guo 2023-06-05   88  		size = ICE_SID_RXPARSER_FLAG_REDIR_ENTRY_SIZE;
a4e7ee58c72b52 Junfeng Guo 2023-06-05   89  		break;
6f877e25596c20 Junfeng Guo 2023-06-05   90  	default:
6f877e25596c20 Junfeng Guo 2023-06-05   91  		return NULL;
6f877e25596c20 Junfeng Guo 2023-06-05   92  	}
6f877e25596c20 Junfeng Guo 2023-06-05   93  
6f877e25596c20 Junfeng Guo 2023-06-05   94  	hdr = section;
6f877e25596c20 Junfeng Guo 2023-06-05   95  	if (index >= le16_to_cpu(hdr->count))
6f877e25596c20 Junfeng Guo 2023-06-05   96  		return NULL;
6f877e25596c20 Junfeng Guo 2023-06-05   97  
6f877e25596c20 Junfeng Guo 2023-06-05  @98  	return (void *)((u64)section + data_off + index * size);
6f877e25596c20 Junfeng Guo 2023-06-05   99  }
6f877e25596c20 Junfeng Guo 2023-06-05  100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
