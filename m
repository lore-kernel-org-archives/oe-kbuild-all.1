Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF5D62C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 07:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694677879; x=1726213879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RtQCDaBP7L/4bx7M4m1qTMsz/LT00/YjUxxmWI/zFMs=;
  b=c7lCU2Anw19elwEAozbqKAz/9HCtkNxDXmGn/o7Ibyf0d9vXn5gdaoLQ
   EDtPfXP4w7mhqbwnU/6x3UcDnJ0whBSdV655lCEeQF2qDp6JTvfAnP4DP
   dkjsdGPfEdTO2vROsxzxIYg8v/rhGTkUCwslrv4Y8prVZ2qiTTtan590M
   g40R3wGKBGhVVV4IPUVgMfQHrF7bxoSHgw4Uf4d8SGZD0o7ImRgaXrQqA
   w+NaXbA1CKG0eIEoKf5a8//d5vxV1TwetpF6JtxgVUTSM45Lx4kJxIo/C
   x/8ih/QMsrPnLxWqvMeyNYmhrICm08uAaNaGhyjLZHx0K2iLGFEIUiSqb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442913330"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="442913330"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 00:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="991298669"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="991298669"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Sep 2023 00:51:17 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgh87-0001Kv-38;
	Thu, 14 Sep 2023 07:51:15 +0000
Date: Thu, 14 Sep 2023 15:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC Draft PATCH net-next] Doc: update bridge doc
Message-ID: <202309141500.tFcscvwX-lkp@intel.com>
References: <20230913092854.1027336-2-liuhangbin@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913092854.1027336-2-liuhangbin@gmail.com>

Hi Hangbin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Hangbin-Liu/Doc-update-bridge-doc/20230913-173039
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230913092854.1027336-2-liuhangbin%40gmail.com
patch subject: [RFC Draft PATCH net-next] Doc: update bridge doc
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309141500.tFcscvwX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141500.tFcscvwX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/uapi/linux/if_bridge.h:88: warning: Function parameter or member 'forward_delay' not described in '__bridge_info'
>> ./include/uapi/linux/if_bridge.h:88: warning: Function parameter or member 'bridge_max_age' not described in '__bridge_info'
>> ./include/uapi/linux/if_bridge.h:88: warning: Function parameter or member 'bridge_hello_time' not described in '__bridge_info'
>> ./include/uapi/linux/if_bridge.h:88: warning: Function parameter or member 'bridge_forward_delay' not described in '__bridge_info'
>> ./include/uapi/linux/if_bridge.h:88: warning: Function parameter or member 'topology_change' not described in '__bridge_info'
>> ./include/uapi/linux/if_bridge.h:88: warning: Function parameter or member 'topology_change_detected' not described in '__bridge_info'
>> ./include/uapi/linux/if_bridge.h:88: warning: Function parameter or member 'root_port' not described in '__bridge_info'
>> ./include/uapi/linux/if_bridge.h:88: warning: Function parameter or member 'stp_enabled' not described in '__bridge_info'
>> ./include/uapi/linux/if_bridge.h:88: warning: Function parameter or member 'ageing_time' not described in '__bridge_info'
>> ./include/uapi/linux/if_bridge.h:88: warning: Function parameter or member 'gc_interval' not described in '__bridge_info'
>> ./include/uapi/linux/if_bridge.h:88: warning: Function parameter or member 'hello_timer_value' not described in '__bridge_info'
>> ./include/uapi/linux/if_bridge.h:88: warning: Function parameter or member 'tcn_timer_value' not described in '__bridge_info'
>> ./include/uapi/linux/if_bridge.h:88: warning: Function parameter or member 'topology_change_timer_value' not described in '__bridge_info'
>> ./include/uapi/linux/if_bridge.h:88: warning: Function parameter or member 'gc_timer_value' not described in '__bridge_info'
>> ./include/uapi/linux/if_bridge.h:115: warning: Function parameter or member 'path_cost' not described in '__port_info'
>> ./include/uapi/linux/if_bridge.h:115: warning: Function parameter or member 'designated_cost' not described in '__port_info'
>> ./include/uapi/linux/if_bridge.h:115: warning: Function parameter or member 'state' not described in '__port_info'
>> ./include/uapi/linux/if_bridge.h:115: warning: Function parameter or member 'top_change_ack' not described in '__port_info'
>> ./include/uapi/linux/if_bridge.h:115: warning: Function parameter or member 'config_pending' not described in '__port_info'
>> ./include/uapi/linux/if_bridge.h:115: warning: Function parameter or member 'unused0' not described in '__port_info'
>> ./include/uapi/linux/if_bridge.h:115: warning: Function parameter or member 'message_age_timer_value' not described in '__port_info'
>> ./include/uapi/linux/if_bridge.h:115: warning: Function parameter or member 'forward_delay_timer_value' not described in '__port_info'
>> ./include/uapi/linux/if_bridge.h:115: warning: Function parameter or member 'hold_timer_value' not described in '__port_info'

vim +88 ./include/uapi/linux/if_bridge.h

607ca46e97a1b6 David Howells 2012-10-13   54  
26bff9744d2e66 Hangbin Liu   2023-09-13   55  /**
26bff9744d2e66 Hangbin Liu   2023-09-13   56   * struct __bridge_info - the bridge information
26bff9744d2e66 Hangbin Liu   2023-09-13   57   *
26bff9744d2e66 Hangbin Liu   2023-09-13   58   * @designated_root: designated root
26bff9744d2e66 Hangbin Liu   2023-09-13   59   *
26bff9744d2e66 Hangbin Liu   2023-09-13   60   * @bridge_id: bridge id
26bff9744d2e66 Hangbin Liu   2023-09-13   61   *
26bff9744d2e66 Hangbin Liu   2023-09-13   62   * @root_path_cost: root path cost
26bff9744d2e66 Hangbin Liu   2023-09-13   63   *
26bff9744d2e66 Hangbin Liu   2023-09-13   64   * @max_age: max age
26bff9744d2e66 Hangbin Liu   2023-09-13   65   *
26bff9744d2e66 Hangbin Liu   2023-09-13   66   * @hello_time: hello time
26bff9744d2e66 Hangbin Liu   2023-09-13   67   */
607ca46e97a1b6 David Howells 2012-10-13   68  struct __bridge_info {
607ca46e97a1b6 David Howells 2012-10-13   69  	__u64 designated_root;
607ca46e97a1b6 David Howells 2012-10-13   70  	__u64 bridge_id;
607ca46e97a1b6 David Howells 2012-10-13   71  	__u32 root_path_cost;
607ca46e97a1b6 David Howells 2012-10-13   72  	__u32 max_age;
607ca46e97a1b6 David Howells 2012-10-13   73  	__u32 hello_time;
607ca46e97a1b6 David Howells 2012-10-13   74  	__u32 forward_delay;
607ca46e97a1b6 David Howells 2012-10-13   75  	__u32 bridge_max_age;
607ca46e97a1b6 David Howells 2012-10-13   76  	__u32 bridge_hello_time;
607ca46e97a1b6 David Howells 2012-10-13   77  	__u32 bridge_forward_delay;
607ca46e97a1b6 David Howells 2012-10-13   78  	__u8 topology_change;
607ca46e97a1b6 David Howells 2012-10-13   79  	__u8 topology_change_detected;
607ca46e97a1b6 David Howells 2012-10-13   80  	__u8 root_port;
607ca46e97a1b6 David Howells 2012-10-13   81  	__u8 stp_enabled;
607ca46e97a1b6 David Howells 2012-10-13   82  	__u32 ageing_time;
607ca46e97a1b6 David Howells 2012-10-13   83  	__u32 gc_interval;
607ca46e97a1b6 David Howells 2012-10-13   84  	__u32 hello_timer_value;
607ca46e97a1b6 David Howells 2012-10-13   85  	__u32 tcn_timer_value;
607ca46e97a1b6 David Howells 2012-10-13   86  	__u32 topology_change_timer_value;
607ca46e97a1b6 David Howells 2012-10-13   87  	__u32 gc_timer_value;
607ca46e97a1b6 David Howells 2012-10-13  @88  };
607ca46e97a1b6 David Howells 2012-10-13   89  
26bff9744d2e66 Hangbin Liu   2023-09-13   90  /**
26bff9744d2e66 Hangbin Liu   2023-09-13   91   * struct __port_info - the bridge port information
26bff9744d2e66 Hangbin Liu   2023-09-13   92   *
26bff9744d2e66 Hangbin Liu   2023-09-13   93   * @designated_root: designated root
26bff9744d2e66 Hangbin Liu   2023-09-13   94   *
26bff9744d2e66 Hangbin Liu   2023-09-13   95   * @designated_bridge: designated bridge
26bff9744d2e66 Hangbin Liu   2023-09-13   96   *
26bff9744d2e66 Hangbin Liu   2023-09-13   97   * @port_id: port id
26bff9744d2e66 Hangbin Liu   2023-09-13   98   *
26bff9744d2e66 Hangbin Liu   2023-09-13   99   * @designated_port: designated port
26bff9744d2e66 Hangbin Liu   2023-09-13  100   */
607ca46e97a1b6 David Howells 2012-10-13  101  struct __port_info {
607ca46e97a1b6 David Howells 2012-10-13  102  	__u64 designated_root;
607ca46e97a1b6 David Howells 2012-10-13  103  	__u64 designated_bridge;
607ca46e97a1b6 David Howells 2012-10-13  104  	__u16 port_id;
607ca46e97a1b6 David Howells 2012-10-13  105  	__u16 designated_port;
607ca46e97a1b6 David Howells 2012-10-13  106  	__u32 path_cost;
607ca46e97a1b6 David Howells 2012-10-13  107  	__u32 designated_cost;
607ca46e97a1b6 David Howells 2012-10-13  108  	__u8 state;
607ca46e97a1b6 David Howells 2012-10-13  109  	__u8 top_change_ack;
607ca46e97a1b6 David Howells 2012-10-13  110  	__u8 config_pending;
607ca46e97a1b6 David Howells 2012-10-13  111  	__u8 unused0;
607ca46e97a1b6 David Howells 2012-10-13  112  	__u32 message_age_timer_value;
607ca46e97a1b6 David Howells 2012-10-13  113  	__u32 forward_delay_timer_value;
607ca46e97a1b6 David Howells 2012-10-13  114  	__u32 hold_timer_value;
607ca46e97a1b6 David Howells 2012-10-13 @115  };
607ca46e97a1b6 David Howells 2012-10-13  116  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
