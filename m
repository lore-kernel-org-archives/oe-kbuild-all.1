Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1D57491
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 23:38:31 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9991224DB83;
	Sat, 15 Apr 2023 07:38:29 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 15 Apr
 2023 07:38:29 +0800
Received: from [192.168.0.6] (113.102.16.222) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 15 Apr
 2023 07:38:28 +0800
Message-ID: <d5d7ec22-dcba-7289-d572-39eaad8b0c83@starfivetech.com>
Date: Sat, 15 Apr 2023 07:38:27 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [linux-next:master 8653/11447] kismet: WARNING: unmet direct
 dependencies detected for RESET_STARFIVE_JH7110 when selected by
 CLK_STARFIVE_JH7110_SYS
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, kernel test robot
	<lkp@intel.com>
CC: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran
	<fazilyildiran@gmail.com>, <oe-kbuild-all@lists.linux.dev>, "Linux Memory
 Management List" <linux-mm@kvack.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
References: <202304140706.aOBNhUj2-lkp@intel.com>
 <20230414-spiritism-nape-b5c340dfb4e7@wendy>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20230414-spiritism-nape-b5c340dfb4e7@wendy>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.102.16.222]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag

On Fri, 14 Apr 2023 07:22:49 +0100, Conor Dooley wrote:
> Hal,
> 
> Could you please submit a fix for this?

No problem. Can I submit it around tomorrow evening?
I have left my office at the moment.

Best regards,
Hal

> 
> On Fri, Apr 14, 2023 at 07:55:32AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   e3342532ecd39bbd9c2ab5b9001cec1589bc37e9
>> commit: 82327b127d4117e5b867cca945f97a5074aef786 [8653/11447] reset: starfive: Add StarFive JH7110 reset driver
>> config: csky-kismet-CONFIG_RESET_STARFIVE_JH7110-CONFIG_CLK_STARFIVE_JH7110_SYS-0-0 (https://download.01.org/0day-ci/archive/20230414/202304140706.aOBNhUj2-lkp@intel.com/config)
>> reproduce:
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=82327b127d4117e5b867cca945f97a5074aef786
>>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>         git fetch --no-tags linux-next master
>>         git checkout 82327b127d4117e5b867cca945f97a5074aef786
>>         # 1. reproduce by kismet
>>            # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
>>            kismet --linux-ksrc=linux --selectees CONFIG_RESET_STARFIVE_JH7110 --selectors CONFIG_CLK_STARFIVE_JH7110_SYS -a=csky
>>         # 2. reproduce by make
>>            # save the config file to linux source tree
>>            cd linux
>>            make ARCH=csky olddefconfig
>> 
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Link: https://lore.kernel.org/oe-kbuild-all/202304140706.aOBNhUj2-lkp@intel.com/
>> 
>> kismet warnings: (new ones prefixed by >>)
>> >> kismet: WARNING: unmet direct dependencies detected for RESET_STARFIVE_JH7110 when selected by CLK_STARFIVE_JH7110_SYS
>>    .config:4526:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
>>    
>>    WARNING: unmet direct dependencies detected for RESET_STARFIVE_JH7110
>>      Depends on [n]: RESET_CONTROLLER [=n] && AUXILIARY_BUS [=y] && CLK_STARFIVE_JH7110_SYS [=y]
>>      Selected by [y]:
>>      - CLK_STARFIVE_JH7110_SYS [=y] && COMMON_CLK [=y] && (ARCH_STARFIVE || COMPILE_TEST [=y])
>> 
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests

