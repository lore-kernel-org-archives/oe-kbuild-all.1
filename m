Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D671DF275
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 11:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729337916; cv=none; b=GifgSLyQMoH4TlR7YPIv926R5LDopKLkmDU1+NufDadCYX0/UgPnPmIkJvXi4xVGSj2UyHRBI9X81eGFu60pXaHEhn02pk5Dvomzrhjjqrqpgwdk/CvTbU+o4bO8CmHs3CgUzyp7B3HnMMniWgkiJSiyqq9EI7LBzZ9058V9e98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729337916; c=relaxed/simple;
	bh=xliTeRKq8Ubg/8gWFk66TUUJKGg3G+7WxNX6IRvq7qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGKu6wJGaK7EvJ/tiQkQ4sXS7GKgzPAeGr/DpkJh1fJ7obaw/OwC7DMBnI6d567zcfR8hg6NC/9Y+Zqck+2AeR0+YvJnd04s1lqD8ydDg1p6xp9efk0p6J3WaGkAWWD9DnVzdbeP2yuw2BPTVTzzGg8g2yI2QJjGeEBZVeHY1BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjJ65Mgr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjJ65Mgr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729337915; x=1760873915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xliTeRKq8Ubg/8gWFk66TUUJKGg3G+7WxNX6IRvq7qc=;
  b=KjJ65MgrXPuKxIj/QG3WvCQVzlYWtgqxWLEsN1ff23b8CpsLm+IIrgFz
   a5SQTgWtU4P1E4h/G76liZyfO1fqNsIQhlyv3zs3QfxP9OwENdG6MVV3v
   i4Mz+An52ouuUIewhrcN6WACcAUrQ+xhRb82iceooawd38eHEyLa1/Nie
   WnJztP4QlFmmJphbWgjDu+dY/5TC6kUDY8Ud9C2Gf8cq/4HJqqMmBjl2r
   D5D7+gNW7CojXNe8cIkRPolGvVPxjbr38KKubrb3K/Wx/O/GAGPO1FkhF
   Pdb/oww9svrAKa/XT3oVScy9xH1LwnMgdhPlrojU7A4kWMg3/bGwLhMv4
   w==;
X-CSE-ConnectionGUID: JSMq2ud2RQipTggbm8Oykg==
X-CSE-MsgGUID: AZMkLw2rRtWWh7TEf2bUYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="40262595"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="40262595"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 04:38:34 -0700
X-CSE-ConnectionGUID: U4X/UXW+T2qVHBo2wlcC8g==
X-CSE-MsgGUID: BiRAVVjCTzC4QrZJdDJmDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="83890979"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Oct 2024 04:38:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t27mu-000OwL-0Y;
	Sat, 19 Oct 2024 11:38:28 +0000
Date: Sat, 19 Oct 2024 19:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: Antonio Quartulli <antonio@openvpn.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>, sd@queasysnail.net,
	ryazanov.s.a@gmail.com, Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, openvpn-devel@lists.sourceforge.net,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v9 11/23] ovpn: store tunnel and transport
 statistics
Message-ID: <202410191934.uhcv7iPs-lkp@intel.com>
References: <20241016-b4-ovpn-v9-11-aabe9d225ad5@openvpn.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-b4-ovpn-v9-11-aabe9d225ad5@openvpn.net>

Hi Antonio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6d858708d465669ba7de17e9c5691eb4019166e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Antonio-Quartulli/netlink-add-NLA_POLICY_MAX_LEN-macro/20241016-092722
base:   6d858708d465669ba7de17e9c5691eb4019166e8
patch link:    https://lore.kernel.org/r/20241016-b4-ovpn-v9-11-aabe9d225ad5%40openvpn.net
patch subject: [PATCH net-next v9 11/23] ovpn: store tunnel and transport statistics
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191934.uhcv7iPs-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ovpn/io.c: socket.h is included more than once.

vim +25 drivers/net/ovpn/io.c

    16	
    17	#include "ovpnstruct.h"
    18	#include "peer.h"
    19	#include "io.h"
    20	#include "bind.h"
    21	#include "crypto.h"
    22	#include "crypto_aead.h"
    23	#include "netlink.h"
    24	#include "proto.h"
  > 25	#include "socket.h"
    26	#include "udp.h"
    27	#include "skb.h"
  > 28	#include "socket.h"
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
