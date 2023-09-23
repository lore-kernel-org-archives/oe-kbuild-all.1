Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4DED2F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 19:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695498424; x=1727034424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nKiPJjWRdxp0K8QKiXvBETO5ywuReFFIxfyIVlWZiNs=;
  b=S9wNmKWonRr0cCZyodBvK8/XQTbwjCX+fAOdcBE6YW7Y4Bki3OfTBcDR
   fAZRHvavkwDIDtZeXoJ6OInYYO+uSZxWPO4jDp6Bw2d2tPl79BMKlY2iw
   W+nhEf2bDKoOeT2uiI8cYFn+eT1JQRREMNGfhYdgaWzxICaIvByBBVvEQ
   5QWbJ1uRU2eurWCXmEE4fT3lwpq1HaVDhZzvsmSkbCPEWVJCSMX35czI1
   3AynCEYthThy4UsPNDEcNXOnsoAChRaqriick1cTPgE1IiuenVN3cOBF1
   K7MPPwKJkCGwi6TUkRSUfYBRURRCDst0/qy2ZwNxp1sesZD3cgoE2+G+2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="371366873"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="371366873"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 12:47:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="891205573"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="891205573"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2023 12:46:02 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk8ag-0002mQ-0S;
	Sat, 23 Sep 2023 19:46:58 +0000
Date: Sun, 24 Sep 2023 03:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: Subash Abhinov Kasiviswanathan <quic_subashab@quicinc.com>,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Subash Abhinov Kasiviswanathan <quic_subashab@quicinc.com>,
	Sean Tranchetti <quic_stranche@quicinc.com>
Subject: Re: [PATCH net-next] net: qualcomm: rmnet: Add side band flow
 control support
Message-ID: <202309240339.EjUjVM7v-lkp@intel.com>
References: <20230920003337.1317132-1-quic_subashab@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920003337.1317132-1-quic_subashab@quicinc.com>

Hi Subash,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Subash-Abhinov-Kasiviswanathan/net-qualcomm-rmnet-Add-side-band-flow-control-support/20230920-083445
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230920003337.1317132-1-quic_subashab%40quicinc.com
patch subject: [PATCH net-next] net: qualcomm: rmnet: Add side band flow control support
config: i386-randconfig-016-20230923 (https://download.01.org/0day-ci/archive/20230924/202309240339.EjUjVM7v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240339.EjUjVM7v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240339.EjUjVM7v-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from usr/include/linux/netdevice.h:32,
                    from ./usr/include/linux/if_arp.h:27,
                    from <command-line>:
>> usr/include/linux/if_link.h:1389:9: error: unknown type name 'u8'
    1389 |         u8 operation;
         |         ^~
   usr/include/linux/if_link.h:1390:9: error: unknown type name 'u8'
    1390 |         u8 txqueue;
         |         ^~
>> usr/include/linux/if_link.h:1391:9: error: unknown type name 'u16'
    1391 |         u16 padding;
         |         ^~~
>> usr/include/linux/if_link.h:1392:9: error: unknown type name 'u32'
    1392 |         u32 mark;
         |         ^~~
--
   In file included from <command-line>:
>> ./usr/include/linux/if_link.h:1389:9: error: unknown type name 'u8'
    1389 |         u8 operation;
         |         ^~
   ./usr/include/linux/if_link.h:1390:9: error: unknown type name 'u8'
    1390 |         u8 txqueue;
         |         ^~
>> ./usr/include/linux/if_link.h:1391:9: error: unknown type name 'u16'
    1391 |         u16 padding;
         |         ^~~
>> ./usr/include/linux/if_link.h:1392:9: error: unknown type name 'u32'
    1392 |         u32 mark;
         |         ^~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
