Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D376C1849
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Nov 2022 04:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1667622403; x=1699158403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2HS4RAiFLcDh9q8NAYvYfBXcwnbLg/G8mYo3kx/y6g0=;
  b=e02lGcyik1lDSfLYKj8BnFxJejCRmxuftUH23fVka1kKGgh/5cc7kqGW
   kq2LKezktoYxlBFbH6Pz95N2oB1H0rkctLfspkEo3YV4taUFKtGWVN834
   8fcMcVEily2S++hOxkERg9uj36+D4X8sprlOYrJEdpKJw2Ed8PSeLVY/V
   o=;
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-iad-1a-m6i4x-617e30c2.us-east-1.amazon.com) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2022 04:26:40 +0000
Received: from EX13MTAUWB002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1a-m6i4x-617e30c2.us-east-1.amazon.com (Postfix) with ESMTPS id A21DC60E23;
	Sat,  5 Nov 2022 04:26:38 +0000 (UTC)
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX13MTAUWB002.ant.amazon.com (10.43.161.202) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Sat, 5 Nov 2022 04:26:32 +0000
Received: from 88665a182662.ant.amazon.com (10.43.160.223) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.15;
 Sat, 5 Nov 2022 04:26:29 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <lkp@intel.com>
CC: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<kuniyu@amazon.com>, <netdev@vger.kernel.org>,
	<oe-kbuild-all@lists.linux.dev>, <pabeni@redhat.com>
Subject: Re: [PATCH v1 net-next 3/6] udp: Set NULL to udp_seq_afinfo.udp_table.
Date: Fri, 4 Nov 2022 21:26:21 -0700
Message-ID: <20221105042621.60952-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <202211051018.L0IaXXnd-lkp@intel.com>
References: <202211051018.L0IaXXnd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.160.223]
X-ClientProxiedBy: EX13D18UWC001.ant.amazon.com (10.43.162.105) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)
Precedence: Bulk

From:   kernel test robot <lkp@intel.com>
Date:   Sat, 5 Nov 2022 11:04:01 +0800
> Hi Kuniyuki,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on net-next/master]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/udp-Introduce-optional-per-netns-hash-table/20221105-031106
> patch link:    https://lore.kernel.org/r/20221104190612.24206-4-kuniyu%40amazon.com
> patch subject: [PATCH v1 net-next 3/6] udp: Set NULL to udp_seq_afinfo.udp_table.
> config: nios2-randconfig-r002-20221104
> compiler: nios2-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/49362b402f7edf31637443640ee33de9c3506260
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Kuniyuki-Iwashima/udp-Introduce-optional-per-netns-hash-table/20221105-031106
>         git checkout 49362b402f7edf31637443640ee33de9c3506260
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash net/ipv4/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All error/warnings (new ones prefixed by >>):
> 
> >> net/ipv4/udp.c:139:54: warning: 'struct udp_seq_afinfo' declared inside parameter list will not be visible outside of this definition or declaration
>      139 | static struct udp_table *udp_get_table_afinfo(struct udp_seq_afinfo *afinfo,
>          |                                                      ^~~~~~~~~~~~~~

Will move this under #ifdef CONFIG_PROC_FS.

Thank you.


>    net/ipv4/udp.c: In function 'udp_get_table_afinfo':
> >> net/ipv4/udp.c:142:22: error: invalid use of undefined type 'struct udp_seq_afinfo'
>      142 |         return afinfo->udp_table ? : net->ipv4.udp_table;
>          |                      ^~
>    net/ipv4/udp.c: At top level:
>    net/ipv4/udp.c:139:26: warning: 'udp_get_table_afinfo' defined but not used [-Wunused-function]
>      139 | static struct udp_table *udp_get_table_afinfo(struct udp_seq_afinfo *afinfo,
>          |                          ^~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +142 net/ipv4/udp.c
> 
>    138	
>  > 139	static struct udp_table *udp_get_table_afinfo(struct udp_seq_afinfo *afinfo,
>    140						      struct net *net)
>    141	{
>  > 142		return afinfo->udp_table ? : net->ipv4.udp_table;
>    143	}
>    144	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
