Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E981F163
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 07:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677741428; x=1709277428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qxJpaiiNN88DuYxcpBYO8I0ekihptwNqYyNVKu60z6E=;
  b=TZjdhAVXC1VjK/lkt16Yc2Vt419VIo6UYZViXJrVEQMA4wNU5CyFZnFh
   0De13DTBF3uTkbMNqXC+FiF3bqVMnsfAcEjNMDJTA/081OZ/82tjnHvXs
   7fn41W1/6wXBs3G9VwwgtLn1onBrPlUHvJqBY0julnq80RI2zFXWaFHLE
   JPjasW/aO5fVK8hj0STIQVX/88x5waTG+M2WhSnWeVwcRXik0BGzczebw
   E+tegrEY+Bw8UcapKa7rfJ8cZVSQRpENOOmMDjaiZFk9e8XXgkwctYGM5
   bVl5fiQnfu1vDxYuW6tc2ZAn7GoQzPYi6g6AiytGeavO7+Bsw90ZGzu4W
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="397206997"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="397206997"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 23:17:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="624809303"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="624809303"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Mar 2023 23:17:06 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXdBZ-0000Ih-2X;
	Thu, 02 Mar 2023 07:17:05 +0000
Date: Thu, 2 Mar 2023 15:16:33 +0800
From: kernel test robot <lkp@intel.com>
To: Wengang Wu <wgw@motorola.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-omap:android-beagle-x15-4.14 9589/30000]
 arch/x86/purgatory/sha256.c:48:13: error: static declaration of
 'sha256_transform' follows non-static declaration
Message-ID: <202303021545.7e2MpNak-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Keerthy,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/omap android-beagle-x15-4.14
head:   bb5a46d9a30e6126b85ef4cf108499488c438462
commit: bed85f9e7d818947ce81db29ecd10c11cce71843 [9589/30000] crypto: sha256_generic: Export the Transform function
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230302/202303021545.7e2MpNak-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build):
        git remote add android-omap https://android.googlesource.com/kernel/omap
        git fetch --no-tags android-omap android-beagle-x15-4.14
        git checkout bed85f9e7d818947ce81db29ecd10c11cce71843
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021545.7e2MpNak-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/purgatory/sha256.c:48:13: error: static declaration of 'sha256_transform' follows non-static declaration
    static void sha256_transform(u32 *state, const u8 *input)
                ^~~~~~~~~~~~~~~~
   In file included from arch/x86/purgatory/sha256.h:14:0,
                    from arch/x86/purgatory/sha256.c:20:
   include/crypto/sha.h:94:13: note: previous declaration of 'sha256_transform' was here
    extern void sha256_transform(u32 *state, const u8 *input);
                ^~~~~~~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:328: arch/x86/purgatory/sha256.o] Error 1
   make[2]: Target 'arch/x86/purgatory/kexec-purgatory.c' not remade because of errors.
   make[1]: *** [arch/x86/Makefile:260: archprepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:146: sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/sha256_transform +48 arch/x86/purgatory/sha256.c

daeba0641a7076 Vivek Goyal 2014-08-08   47  
daeba0641a7076 Vivek Goyal 2014-08-08  @48  static void sha256_transform(u32 *state, const u8 *input)
daeba0641a7076 Vivek Goyal 2014-08-08   49  {
daeba0641a7076 Vivek Goyal 2014-08-08   50  	u32 a, b, c, d, e, f, g, h, t1, t2;
daeba0641a7076 Vivek Goyal 2014-08-08   51  	u32 W[64];
daeba0641a7076 Vivek Goyal 2014-08-08   52  	int i;
daeba0641a7076 Vivek Goyal 2014-08-08   53  
daeba0641a7076 Vivek Goyal 2014-08-08   54  	/* load the input */
daeba0641a7076 Vivek Goyal 2014-08-08   55  	for (i = 0; i < 16; i++)
daeba0641a7076 Vivek Goyal 2014-08-08   56  		LOAD_OP(i, W, input);
daeba0641a7076 Vivek Goyal 2014-08-08   57  
daeba0641a7076 Vivek Goyal 2014-08-08   58  	/* now blend */
daeba0641a7076 Vivek Goyal 2014-08-08   59  	for (i = 16; i < 64; i++)
daeba0641a7076 Vivek Goyal 2014-08-08   60  		BLEND_OP(i, W);
daeba0641a7076 Vivek Goyal 2014-08-08   61  
daeba0641a7076 Vivek Goyal 2014-08-08   62  	/* load the state into our registers */
daeba0641a7076 Vivek Goyal 2014-08-08   63  	a = state[0];  b = state[1];  c = state[2];  d = state[3];
daeba0641a7076 Vivek Goyal 2014-08-08   64  	e = state[4];  f = state[5];  g = state[6];  h = state[7];
daeba0641a7076 Vivek Goyal 2014-08-08   65  
daeba0641a7076 Vivek Goyal 2014-08-08   66  	/* now iterate */
daeba0641a7076 Vivek Goyal 2014-08-08   67  	t1 = h + e1(e) + Ch(e, f, g) + 0x428a2f98 + W[0];
daeba0641a7076 Vivek Goyal 2014-08-08   68  	t2 = e0(a) + Maj(a, b, c);    d += t1;    h = t1 + t2;
daeba0641a7076 Vivek Goyal 2014-08-08   69  	t1 = g + e1(d) + Ch(d, e, f) + 0x71374491 + W[1];
daeba0641a7076 Vivek Goyal 2014-08-08   70  	t2 = e0(h) + Maj(h, a, b);    c += t1;    g = t1 + t2;
daeba0641a7076 Vivek Goyal 2014-08-08   71  	t1 = f + e1(c) + Ch(c, d, e) + 0xb5c0fbcf + W[2];
daeba0641a7076 Vivek Goyal 2014-08-08   72  	t2 = e0(g) + Maj(g, h, a);    b += t1;    f = t1 + t2;
daeba0641a7076 Vivek Goyal 2014-08-08   73  	t1 = e + e1(b) + Ch(b, c, d) + 0xe9b5dba5 + W[3];
daeba0641a7076 Vivek Goyal 2014-08-08   74  	t2 = e0(f) + Maj(f, g, h);    a += t1;    e = t1 + t2;
daeba0641a7076 Vivek Goyal 2014-08-08   75  	t1 = d + e1(a) + Ch(a, b, c) + 0x3956c25b + W[4];
daeba0641a7076 Vivek Goyal 2014-08-08   76  	t2 = e0(e) + Maj(e, f, g);    h += t1;    d = t1 + t2;
daeba0641a7076 Vivek Goyal 2014-08-08   77  	t1 = c + e1(h) + Ch(h, a, b) + 0x59f111f1 + W[5];
daeba0641a7076 Vivek Goyal 2014-08-08   78  	t2 = e0(d) + Maj(d, e, f);    g += t1;    c = t1 + t2;
daeba0641a7076 Vivek Goyal 2014-08-08   79  	t1 = b + e1(g) + Ch(g, h, a) + 0x923f82a4 + W[6];
daeba0641a7076 Vivek Goyal 2014-08-08   80  	t2 = e0(c) + Maj(c, d, e);    f += t1;    b = t1 + t2;
daeba0641a7076 Vivek Goyal 2014-08-08   81  	t1 = a + e1(f) + Ch(f, g, h) + 0xab1c5ed5 + W[7];
daeba0641a7076 Vivek Goyal 2014-08-08   82  	t2 = e0(b) + Maj(b, c, d);    e += t1;    a = t1 + t2;
daeba0641a7076 Vivek Goyal 2014-08-08   83  
daeba0641a7076 Vivek Goyal 2014-08-08   84  	t1 = h + e1(e) + Ch(e, f, g) + 0xd807aa98 + W[8];
daeba0641a7076 Vivek Goyal 2014-08-08   85  	t2 = e0(a) + Maj(a, b, c);    d += t1;    h = t1 + t2;
daeba0641a7076 Vivek Goyal 2014-08-08   86  	t1 = g + e1(d) + Ch(d, e, f) + 0x12835b01 + W[9];
daeba0641a7076 Vivek Goyal 2014-08-08   87  	t2 = e0(h) + Maj(h, a, b);    c += t1;    g = t1 + t2;
daeba0641a7076 Vivek Goyal 2014-08-08   88  	t1 = f + e1(c) + Ch(c, d, e) + 0x243185be + W[10];
daeba0641a7076 Vivek Goyal 2014-08-08   89  	t2 = e0(g) + Maj(g, h, a);    b += t1;    f = t1 + t2;
daeba0641a7076 Vivek Goyal 2014-08-08   90  	t1 = e + e1(b) + Ch(b, c, d) + 0x550c7dc3 + W[11];
daeba0641a7076 Vivek Goyal 2014-08-08   91  	t2 = e0(f) + Maj(f, g, h);    a += t1;    e = t1 + t2;
daeba0641a7076 Vivek Goyal 2014-08-08   92  	t1 = d + e1(a) + Ch(a, b, c) + 0x72be5d74 + W[12];
daeba0641a7076 Vivek Goyal 2014-08-08   93  	t2 = e0(e) + Maj(e, f, g);    h += t1;    d = t1 + t2;
daeba0641a7076 Vivek Goyal 2014-08-08   94  	t1 = c + e1(h) + Ch(h, a, b) + 0x80deb1fe + W[13];
daeba0641a7076 Vivek Goyal 2014-08-08   95  	t2 = e0(d) + Maj(d, e, f);    g += t1;    c = t1 + t2;
daeba0641a7076 Vivek Goyal 2014-08-08   96  	t1 = b + e1(g) + Ch(g, h, a) + 0x9bdc06a7 + W[14];
daeba0641a7076 Vivek Goyal 2014-08-08   97  	t2 = e0(c) + Maj(c, d, e);    f += t1;    b = t1 + t2;
daeba0641a7076 Vivek Goyal 2014-08-08   98  	t1 = a + e1(f) + Ch(f, g, h) + 0xc19bf174 + W[15];
daeba0641a7076 Vivek Goyal 2014-08-08   99  	t2 = e0(b) + Maj(b, c, d);    e += t1;    a = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  100  
daeba0641a7076 Vivek Goyal 2014-08-08  101  	t1 = h + e1(e) + Ch(e, f, g) + 0xe49b69c1 + W[16];
daeba0641a7076 Vivek Goyal 2014-08-08  102  	t2 = e0(a) + Maj(a, b, c);    d += t1;    h = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  103  	t1 = g + e1(d) + Ch(d, e, f) + 0xefbe4786 + W[17];
daeba0641a7076 Vivek Goyal 2014-08-08  104  	t2 = e0(h) + Maj(h, a, b);    c += t1;    g = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  105  	t1 = f + e1(c) + Ch(c, d, e) + 0x0fc19dc6 + W[18];
daeba0641a7076 Vivek Goyal 2014-08-08  106  	t2 = e0(g) + Maj(g, h, a);    b += t1;    f = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  107  	t1 = e + e1(b) + Ch(b, c, d) + 0x240ca1cc + W[19];
daeba0641a7076 Vivek Goyal 2014-08-08  108  	t2 = e0(f) + Maj(f, g, h);    a += t1;    e = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  109  	t1 = d + e1(a) + Ch(a, b, c) + 0x2de92c6f + W[20];
daeba0641a7076 Vivek Goyal 2014-08-08  110  	t2 = e0(e) + Maj(e, f, g);    h += t1;    d = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  111  	t1 = c + e1(h) + Ch(h, a, b) + 0x4a7484aa + W[21];
daeba0641a7076 Vivek Goyal 2014-08-08  112  	t2 = e0(d) + Maj(d, e, f);    g += t1;    c = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  113  	t1 = b + e1(g) + Ch(g, h, a) + 0x5cb0a9dc + W[22];
daeba0641a7076 Vivek Goyal 2014-08-08  114  	t2 = e0(c) + Maj(c, d, e);    f += t1;    b = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  115  	t1 = a + e1(f) + Ch(f, g, h) + 0x76f988da + W[23];
daeba0641a7076 Vivek Goyal 2014-08-08  116  	t2 = e0(b) + Maj(b, c, d);    e += t1;    a = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  117  
daeba0641a7076 Vivek Goyal 2014-08-08  118  	t1 = h + e1(e) + Ch(e, f, g) + 0x983e5152 + W[24];
daeba0641a7076 Vivek Goyal 2014-08-08  119  	t2 = e0(a) + Maj(a, b, c);    d += t1;    h = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  120  	t1 = g + e1(d) + Ch(d, e, f) + 0xa831c66d + W[25];
daeba0641a7076 Vivek Goyal 2014-08-08  121  	t2 = e0(h) + Maj(h, a, b);    c += t1;    g = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  122  	t1 = f + e1(c) + Ch(c, d, e) + 0xb00327c8 + W[26];
daeba0641a7076 Vivek Goyal 2014-08-08  123  	t2 = e0(g) + Maj(g, h, a);    b += t1;    f = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  124  	t1 = e + e1(b) + Ch(b, c, d) + 0xbf597fc7 + W[27];
daeba0641a7076 Vivek Goyal 2014-08-08  125  	t2 = e0(f) + Maj(f, g, h);    a += t1;    e = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  126  	t1 = d + e1(a) + Ch(a, b, c) + 0xc6e00bf3 + W[28];
daeba0641a7076 Vivek Goyal 2014-08-08  127  	t2 = e0(e) + Maj(e, f, g);    h += t1;    d = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  128  	t1 = c + e1(h) + Ch(h, a, b) + 0xd5a79147 + W[29];
daeba0641a7076 Vivek Goyal 2014-08-08  129  	t2 = e0(d) + Maj(d, e, f);    g += t1;    c = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  130  	t1 = b + e1(g) + Ch(g, h, a) + 0x06ca6351 + W[30];
daeba0641a7076 Vivek Goyal 2014-08-08  131  	t2 = e0(c) + Maj(c, d, e);    f += t1;    b = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  132  	t1 = a + e1(f) + Ch(f, g, h) + 0x14292967 + W[31];
daeba0641a7076 Vivek Goyal 2014-08-08  133  	t2 = e0(b) + Maj(b, c, d);    e += t1;    a = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  134  
daeba0641a7076 Vivek Goyal 2014-08-08  135  	t1 = h + e1(e) + Ch(e, f, g) + 0x27b70a85 + W[32];
daeba0641a7076 Vivek Goyal 2014-08-08  136  	t2 = e0(a) + Maj(a, b, c);    d += t1;    h = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  137  	t1 = g + e1(d) + Ch(d, e, f) + 0x2e1b2138 + W[33];
daeba0641a7076 Vivek Goyal 2014-08-08  138  	t2 = e0(h) + Maj(h, a, b);    c += t1;    g = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  139  	t1 = f + e1(c) + Ch(c, d, e) + 0x4d2c6dfc + W[34];
daeba0641a7076 Vivek Goyal 2014-08-08  140  	t2 = e0(g) + Maj(g, h, a);    b += t1;    f = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  141  	t1 = e + e1(b) + Ch(b, c, d) + 0x53380d13 + W[35];
daeba0641a7076 Vivek Goyal 2014-08-08  142  	t2 = e0(f) + Maj(f, g, h);    a += t1;    e = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  143  	t1 = d + e1(a) + Ch(a, b, c) + 0x650a7354 + W[36];
daeba0641a7076 Vivek Goyal 2014-08-08  144  	t2 = e0(e) + Maj(e, f, g);    h += t1;    d = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  145  	t1 = c + e1(h) + Ch(h, a, b) + 0x766a0abb + W[37];
daeba0641a7076 Vivek Goyal 2014-08-08  146  	t2 = e0(d) + Maj(d, e, f);    g += t1;    c = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  147  	t1 = b + e1(g) + Ch(g, h, a) + 0x81c2c92e + W[38];
daeba0641a7076 Vivek Goyal 2014-08-08  148  	t2 = e0(c) + Maj(c, d, e);    f += t1;    b = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  149  	t1 = a + e1(f) + Ch(f, g, h) + 0x92722c85 + W[39];
daeba0641a7076 Vivek Goyal 2014-08-08  150  	t2 = e0(b) + Maj(b, c, d);    e += t1;    a = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  151  
daeba0641a7076 Vivek Goyal 2014-08-08  152  	t1 = h + e1(e) + Ch(e, f, g) + 0xa2bfe8a1 + W[40];
daeba0641a7076 Vivek Goyal 2014-08-08  153  	t2 = e0(a) + Maj(a, b, c);    d += t1;    h = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  154  	t1 = g + e1(d) + Ch(d, e, f) + 0xa81a664b + W[41];
daeba0641a7076 Vivek Goyal 2014-08-08  155  	t2 = e0(h) + Maj(h, a, b);    c += t1;    g = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  156  	t1 = f + e1(c) + Ch(c, d, e) + 0xc24b8b70 + W[42];
daeba0641a7076 Vivek Goyal 2014-08-08  157  	t2 = e0(g) + Maj(g, h, a);    b += t1;    f = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  158  	t1 = e + e1(b) + Ch(b, c, d) + 0xc76c51a3 + W[43];
daeba0641a7076 Vivek Goyal 2014-08-08  159  	t2 = e0(f) + Maj(f, g, h);    a += t1;    e = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  160  	t1 = d + e1(a) + Ch(a, b, c) + 0xd192e819 + W[44];
daeba0641a7076 Vivek Goyal 2014-08-08  161  	t2 = e0(e) + Maj(e, f, g);    h += t1;    d = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  162  	t1 = c + e1(h) + Ch(h, a, b) + 0xd6990624 + W[45];
daeba0641a7076 Vivek Goyal 2014-08-08  163  	t2 = e0(d) + Maj(d, e, f);    g += t1;    c = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  164  	t1 = b + e1(g) + Ch(g, h, a) + 0xf40e3585 + W[46];
daeba0641a7076 Vivek Goyal 2014-08-08  165  	t2 = e0(c) + Maj(c, d, e);    f += t1;    b = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  166  	t1 = a + e1(f) + Ch(f, g, h) + 0x106aa070 + W[47];
daeba0641a7076 Vivek Goyal 2014-08-08  167  	t2 = e0(b) + Maj(b, c, d);    e += t1;    a = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  168  
daeba0641a7076 Vivek Goyal 2014-08-08  169  	t1 = h + e1(e) + Ch(e, f, g) + 0x19a4c116 + W[48];
daeba0641a7076 Vivek Goyal 2014-08-08  170  	t2 = e0(a) + Maj(a, b, c);    d += t1;    h = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  171  	t1 = g + e1(d) + Ch(d, e, f) + 0x1e376c08 + W[49];
daeba0641a7076 Vivek Goyal 2014-08-08  172  	t2 = e0(h) + Maj(h, a, b);    c += t1;    g = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  173  	t1 = f + e1(c) + Ch(c, d, e) + 0x2748774c + W[50];
daeba0641a7076 Vivek Goyal 2014-08-08  174  	t2 = e0(g) + Maj(g, h, a);    b += t1;    f = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  175  	t1 = e + e1(b) + Ch(b, c, d) + 0x34b0bcb5 + W[51];
daeba0641a7076 Vivek Goyal 2014-08-08  176  	t2 = e0(f) + Maj(f, g, h);    a += t1;    e = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  177  	t1 = d + e1(a) + Ch(a, b, c) + 0x391c0cb3 + W[52];
daeba0641a7076 Vivek Goyal 2014-08-08  178  	t2 = e0(e) + Maj(e, f, g);    h += t1;    d = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  179  	t1 = c + e1(h) + Ch(h, a, b) + 0x4ed8aa4a + W[53];
daeba0641a7076 Vivek Goyal 2014-08-08  180  	t2 = e0(d) + Maj(d, e, f);    g += t1;    c = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  181  	t1 = b + e1(g) + Ch(g, h, a) + 0x5b9cca4f + W[54];
daeba0641a7076 Vivek Goyal 2014-08-08  182  	t2 = e0(c) + Maj(c, d, e);    f += t1;    b = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  183  	t1 = a + e1(f) + Ch(f, g, h) + 0x682e6ff3 + W[55];
daeba0641a7076 Vivek Goyal 2014-08-08  184  	t2 = e0(b) + Maj(b, c, d);    e += t1;    a = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  185  
daeba0641a7076 Vivek Goyal 2014-08-08  186  	t1 = h + e1(e) + Ch(e, f, g) + 0x748f82ee + W[56];
daeba0641a7076 Vivek Goyal 2014-08-08  187  	t2 = e0(a) + Maj(a, b, c);    d += t1;    h = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  188  	t1 = g + e1(d) + Ch(d, e, f) + 0x78a5636f + W[57];
daeba0641a7076 Vivek Goyal 2014-08-08  189  	t2 = e0(h) + Maj(h, a, b);    c += t1;    g = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  190  	t1 = f + e1(c) + Ch(c, d, e) + 0x84c87814 + W[58];
daeba0641a7076 Vivek Goyal 2014-08-08  191  	t2 = e0(g) + Maj(g, h, a);    b += t1;    f = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  192  	t1 = e + e1(b) + Ch(b, c, d) + 0x8cc70208 + W[59];
daeba0641a7076 Vivek Goyal 2014-08-08  193  	t2 = e0(f) + Maj(f, g, h);    a += t1;    e = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  194  	t1 = d + e1(a) + Ch(a, b, c) + 0x90befffa + W[60];
daeba0641a7076 Vivek Goyal 2014-08-08  195  	t2 = e0(e) + Maj(e, f, g);    h += t1;    d = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  196  	t1 = c + e1(h) + Ch(h, a, b) + 0xa4506ceb + W[61];
daeba0641a7076 Vivek Goyal 2014-08-08  197  	t2 = e0(d) + Maj(d, e, f);    g += t1;    c = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  198  	t1 = b + e1(g) + Ch(g, h, a) + 0xbef9a3f7 + W[62];
daeba0641a7076 Vivek Goyal 2014-08-08  199  	t2 = e0(c) + Maj(c, d, e);    f += t1;    b = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  200  	t1 = a + e1(f) + Ch(f, g, h) + 0xc67178f2 + W[63];
daeba0641a7076 Vivek Goyal 2014-08-08  201  	t2 = e0(b) + Maj(b, c, d);    e += t1;    a = t1+t2;
daeba0641a7076 Vivek Goyal 2014-08-08  202  
daeba0641a7076 Vivek Goyal 2014-08-08  203  	state[0] += a; state[1] += b; state[2] += c; state[3] += d;
daeba0641a7076 Vivek Goyal 2014-08-08  204  	state[4] += e; state[5] += f; state[6] += g; state[7] += h;
daeba0641a7076 Vivek Goyal 2014-08-08  205  
daeba0641a7076 Vivek Goyal 2014-08-08  206  	/* clear any sensitive info... */
daeba0641a7076 Vivek Goyal 2014-08-08  207  	a = b = c = d = e = f = g = h = t1 = t2 = 0;
daeba0641a7076 Vivek Goyal 2014-08-08  208  	memset(W, 0, 64 * sizeof(u32));
daeba0641a7076 Vivek Goyal 2014-08-08  209  }
daeba0641a7076 Vivek Goyal 2014-08-08  210  

:::::: The code at line 48 was first introduced by commit
:::::: daeba0641a707626f3674db71016f333edf64395 purgatory/sha256: provide implementation of sha256 in purgaotory context

:::::: TO: Vivek Goyal <vgoyal@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
