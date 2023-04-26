Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA916FC7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 21:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682544070; x=1714080070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+oUvQZIZK5d+wcyfBlKGDZ+4fheT9tXp50SuAENlQUo=;
  b=PJLUQC2FUbfE9t9ghEs1B2vHUlYBizHwnoNT9icQs/ik/M0qqqlhn3+U
   937fgeXaQNmCYNX46HQiwYuW0/mR6h0XIBJWsgH2goaNN7hKNujCDfoFq
   XfDnsq3VFGNDVlErk6+rdILv7jR37rf4gyfn9gfYDsIdQ4UpPqpAStkJV
   ChJTa7HMOzZRLUSM/pyI9XXgHIIjx3TktU9F4Uklqhxv4SQ5mn7p85mFK
   BcQ18T3ymm2MnqxiiNsQfs500p4g2L5yHYJocjH/EY9IzcZ6faD4PAQ1P
   uYYExPFjEMI7zc7xRsF5MYqS+wo/9fUGe2qhzqPcIH2PeurrHCTHtl9IG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="344688980"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="344688980"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 14:20:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="805677424"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="805677424"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2023 14:20:53 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prmZJ-0000X0-0E;
	Wed, 26 Apr 2023 21:20:53 +0000
Date: Thu, 27 Apr 2023 05:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:ip_tunnel 8/13] net/ipv4/fou_bpf.c:69:35: error:
 'TUNNEL_CSUM' undeclared
Message-ID: <202304270550.omOpQWCX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux ip_tunnel
head:   f74bfcd5e2a03cf74e1712f972721fda28d1dcea
commit: fcdcb3cb96f06940e09254b1fbcca0695506193a [8/13] ip_tunnel: convert __be16 tunnel flags to bitmaps
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230427/202304270550.omOpQWCX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/alobakin/linux/commit/fcdcb3cb96f06940e09254b1fbcca0695506193a
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin ip_tunnel
        git checkout fcdcb3cb96f06940e09254b1fbcca0695506193a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270550.omOpQWCX-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/fou_bpf.c: In function 'bpf_skb_set_fou_encap':
>> net/ipv4/fou_bpf.c:69:35: error: 'TUNNEL_CSUM' undeclared (first use in this function)
      69 |         if (info->key.tun_flags & TUNNEL_CSUM)
         |                                   ^~~~~~~~~~~
   net/ipv4/fou_bpf.c:69:35: note: each undeclared identifier is reported only once for each function it appears in


vim +/TUNNEL_CSUM +69 net/ipv4/fou_bpf.c

c50e96099edb13 Christian Ehrig 2023-04-07  24  
c50e96099edb13 Christian Ehrig 2023-04-07  25  __diag_push();
c50e96099edb13 Christian Ehrig 2023-04-07  26  __diag_ignore_all("-Wmissing-prototypes",
c50e96099edb13 Christian Ehrig 2023-04-07  27  		  "Global functions as their definitions will be in BTF");
c50e96099edb13 Christian Ehrig 2023-04-07  28  
c50e96099edb13 Christian Ehrig 2023-04-07  29  /* bpf_skb_set_fou_encap - Set FOU encap parameters
c50e96099edb13 Christian Ehrig 2023-04-07  30   *
c50e96099edb13 Christian Ehrig 2023-04-07  31   * This function allows for using GUE or FOU encapsulation together with an
c50e96099edb13 Christian Ehrig 2023-04-07  32   * ipip device in collect-metadata mode.
c50e96099edb13 Christian Ehrig 2023-04-07  33   *
c50e96099edb13 Christian Ehrig 2023-04-07  34   * It is meant to be used in BPF tc-hooks and after a call to the
c50e96099edb13 Christian Ehrig 2023-04-07  35   * bpf_skb_set_tunnel_key helper, responsible for setting IP addresses.
c50e96099edb13 Christian Ehrig 2023-04-07  36   *
c50e96099edb13 Christian Ehrig 2023-04-07  37   * Parameters:
c50e96099edb13 Christian Ehrig 2023-04-07  38   * @skb_ctx	Pointer to ctx (__sk_buff) in TC program. Cannot be NULL
c50e96099edb13 Christian Ehrig 2023-04-07  39   * @encap	Pointer to a `struct bpf_fou_encap` storing UDP src and
c50e96099edb13 Christian Ehrig 2023-04-07  40   * 		dst ports. If sport is set to 0 the kernel will auto-assign a
c50e96099edb13 Christian Ehrig 2023-04-07  41   * 		port. This is similar to using `encap-sport auto`.
c50e96099edb13 Christian Ehrig 2023-04-07  42   * 		Cannot be NULL
c50e96099edb13 Christian Ehrig 2023-04-07  43   * @type	Encapsulation type for the packet. Their definitions are
c50e96099edb13 Christian Ehrig 2023-04-07  44   * 		specified in `enum bpf_fou_encap_type`
c50e96099edb13 Christian Ehrig 2023-04-07  45   */
c50e96099edb13 Christian Ehrig 2023-04-07  46  __bpf_kfunc int bpf_skb_set_fou_encap(struct __sk_buff *skb_ctx,
c50e96099edb13 Christian Ehrig 2023-04-07  47  				      struct bpf_fou_encap *encap, int type)
c50e96099edb13 Christian Ehrig 2023-04-07  48  {
c50e96099edb13 Christian Ehrig 2023-04-07  49  	struct sk_buff *skb = (struct sk_buff *)skb_ctx;
c50e96099edb13 Christian Ehrig 2023-04-07  50  	struct ip_tunnel_info *info = skb_tunnel_info(skb);
c50e96099edb13 Christian Ehrig 2023-04-07  51  
c50e96099edb13 Christian Ehrig 2023-04-07  52  	if (unlikely(!encap))
c50e96099edb13 Christian Ehrig 2023-04-07  53  		return -EINVAL;
c50e96099edb13 Christian Ehrig 2023-04-07  54  
c50e96099edb13 Christian Ehrig 2023-04-07  55  	if (unlikely(!info || !(info->mode & IP_TUNNEL_INFO_TX)))
c50e96099edb13 Christian Ehrig 2023-04-07  56  		return -EINVAL;
c50e96099edb13 Christian Ehrig 2023-04-07  57  
c50e96099edb13 Christian Ehrig 2023-04-07  58  	switch (type) {
c50e96099edb13 Christian Ehrig 2023-04-07  59  	case FOU_BPF_ENCAP_FOU:
c50e96099edb13 Christian Ehrig 2023-04-07  60  		info->encap.type = TUNNEL_ENCAP_FOU;
c50e96099edb13 Christian Ehrig 2023-04-07  61  		break;
c50e96099edb13 Christian Ehrig 2023-04-07  62  	case FOU_BPF_ENCAP_GUE:
c50e96099edb13 Christian Ehrig 2023-04-07  63  		info->encap.type = TUNNEL_ENCAP_GUE;
c50e96099edb13 Christian Ehrig 2023-04-07  64  		break;
c50e96099edb13 Christian Ehrig 2023-04-07  65  	default:
c50e96099edb13 Christian Ehrig 2023-04-07  66  		info->encap.type = TUNNEL_ENCAP_NONE;
c50e96099edb13 Christian Ehrig 2023-04-07  67  	}
c50e96099edb13 Christian Ehrig 2023-04-07  68  
c50e96099edb13 Christian Ehrig 2023-04-07 @69  	if (info->key.tun_flags & TUNNEL_CSUM)
c50e96099edb13 Christian Ehrig 2023-04-07  70  		info->encap.flags |= TUNNEL_ENCAP_FLAG_CSUM;
c50e96099edb13 Christian Ehrig 2023-04-07  71  
c50e96099edb13 Christian Ehrig 2023-04-07  72  	info->encap.sport = encap->sport;
c50e96099edb13 Christian Ehrig 2023-04-07  73  	info->encap.dport = encap->dport;
c50e96099edb13 Christian Ehrig 2023-04-07  74  
c50e96099edb13 Christian Ehrig 2023-04-07  75  	return 0;
c50e96099edb13 Christian Ehrig 2023-04-07  76  }
c50e96099edb13 Christian Ehrig 2023-04-07  77  

:::::: The code at line 69 was first introduced by commit
:::::: c50e96099edb134bf107fafc02715fbc4aa2277f bpf,fou: Add bpf_skb_{set,get}_fou_encap kfuncs

:::::: TO: Christian Ehrig <cehrig@cloudflare.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
