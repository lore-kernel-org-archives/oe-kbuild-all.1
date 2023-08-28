Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928DA360
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 00:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693182254; x=1724718254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CRfHnNSxznErv05trblhrLXtluLaDzfvfI9QG7rFqzQ=;
  b=jN8lLCXVzReZGDzkMfnGPPH5bimzrlVeNoIlunimBQQR347sHzE9biBW
   QMVo1ULb03XAnHuJHurKm2ZwSX/1fntzgc56VYP+9Y9jH8srW4N7l2S3P
   7yUCqcRMAMY54YnNvmIvSsVLc56KYzO2IEy51I9ZwpaKLCnkq8ssBmojP
   +2ztmLQ7yhvcZiziaEwspzFZw5iNQFNq6AEFLSEKIwN7nIM/L+kq+m2HF
   tkvbP5AxVp55nG1Zm1GjPgdvMVeBK9Mlrq0fT1jN2Bq6PQQWp/nFTkas4
   sY0/x/Z9hdpE7iagpXjixZB3qQEQutGbPD/UBfM5QYDitIW9J3h/zC3PY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="365183406"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="365183406"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 17:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="861643502"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="861643502"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Aug 2023 17:24:11 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaQ38-0006LD-1U;
	Mon, 28 Aug 2023 00:24:10 +0000
Date: Mon, 28 Aug 2023 08:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 7542/9999] net/bluetooth/hci_sock.c:1931:
 Error: unrecognized opcode `csrs sstatus,s8', extension `zicsr' required
Message-ID: <202308280832.8lWlXcnr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   4e5e7fa94ee0ff378b268679d51feb1fd2a04756
commit: 3719acc161d5c1ce09912cc1c9eddc2c5faa3c66 [7542/9999] Bluetooth: defer cleanup of resources in hci_unregister_dev()
config: riscv-randconfig-r034-20230828 (https://download.01.org/0day-ci/archive/20230828/202308280832.8lWlXcnr-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280832.8lWlXcnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308280832.8lWlXcnr-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/bluetooth/hci_sock.c: Assembler messages:
>> net/bluetooth/hci_sock.c:1931: Error: unrecognized opcode `csrs sstatus,s8', extension `zicsr' required
>> net/bluetooth/hci_sock.c:1931: Error: unrecognized opcode `csrc sstatus,s8', extension `zicsr' required
   net/bluetooth/hci_sock.c:1948: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/bluetooth/hci_sock.c:1948: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   net/bluetooth/hci_sock.c:1958: Error: unrecognized opcode `csrs sstatus,s8', extension `zicsr' required
   net/bluetooth/hci_sock.c:1958: Error: unrecognized opcode `csrc sstatus,s8', extension `zicsr' required
   net/bluetooth/hci_sock.c:1854: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/bluetooth/hci_sock.c:1854: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   net/bluetooth/hci_sock.c:1866: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/bluetooth/hci_sock.c:1866: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required


vim +1931 net/bluetooth/hci_sock.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1918  
8fc9ced3988247 Gustavo Padovan 2012-05-23  1919  static int hci_sock_getsockopt(struct socket *sock, int level, int optname,
8fc9ced3988247 Gustavo Padovan 2012-05-23  1920  			       char __user *optval, int __user *optlen)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1921  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1922  	struct hci_ufilter uf;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1923  	struct sock *sk = sock->sk;
cedc5469778846 Marcel Holtmann 2012-02-20  1924  	int len, opt, err = 0;
cedc5469778846 Marcel Holtmann 2012-02-20  1925  
cedc5469778846 Marcel Holtmann 2012-02-20  1926  	BT_DBG("sk %p, opt %d", sk, optname);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1927  
47b0f573f2fa76 Marcel Holtmann 2016-08-27  1928  	if (level != SOL_HCI)
47b0f573f2fa76 Marcel Holtmann 2016-08-27  1929  		return -ENOPROTOOPT;
47b0f573f2fa76 Marcel Holtmann 2016-08-27  1930  
^1da177e4c3f41 Linus Torvalds  2005-04-16 @1931  	if (get_user(len, optlen))
^1da177e4c3f41 Linus Torvalds  2005-04-16  1932  		return -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1933  
cedc5469778846 Marcel Holtmann 2012-02-20  1934  	lock_sock(sk);
cedc5469778846 Marcel Holtmann 2012-02-20  1935  
cedc5469778846 Marcel Holtmann 2012-02-20  1936  	if (hci_pi(sk)->channel != HCI_CHANNEL_RAW) {
c2371e80b3d0d1 Marcel Holtmann 2013-08-26  1937  		err = -EBADFD;
cedc5469778846 Marcel Holtmann 2012-02-20  1938  		goto done;
cedc5469778846 Marcel Holtmann 2012-02-20  1939  	}
cedc5469778846 Marcel Holtmann 2012-02-20  1940  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1941  	switch (optname) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1942  	case HCI_DATA_DIR:
^1da177e4c3f41 Linus Torvalds  2005-04-16  1943  		if (hci_pi(sk)->cmsg_mask & HCI_CMSG_DIR)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1944  			opt = 1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1945  		else
^1da177e4c3f41 Linus Torvalds  2005-04-16  1946  			opt = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1947  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1948  		if (put_user(opt, optval))
cedc5469778846 Marcel Holtmann 2012-02-20  1949  			err = -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1950  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1951  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1952  	case HCI_TIME_STAMP:
^1da177e4c3f41 Linus Torvalds  2005-04-16  1953  		if (hci_pi(sk)->cmsg_mask & HCI_CMSG_TSTAMP)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1954  			opt = 1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1955  		else
^1da177e4c3f41 Linus Torvalds  2005-04-16  1956  			opt = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1957  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1958  		if (put_user(opt, optval))
cedc5469778846 Marcel Holtmann 2012-02-20  1959  			err = -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1960  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1961  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1962  	case HCI_FILTER:
^1da177e4c3f41 Linus Torvalds  2005-04-16  1963  		{
^1da177e4c3f41 Linus Torvalds  2005-04-16  1964  			struct hci_filter *f = &hci_pi(sk)->filter;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1965  
e15ca9a0ef9a86 Mathias Krause  2012-08-15  1966  			memset(&uf, 0, sizeof(uf));
^1da177e4c3f41 Linus Torvalds  2005-04-16  1967  			uf.type_mask = f->type_mask;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1968  			uf.opcode    = f->opcode;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1969  			uf.event_mask[0] = *((u32 *) f->event_mask + 0);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1970  			uf.event_mask[1] = *((u32 *) f->event_mask + 1);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1971  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1972  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1973  		len = min_t(unsigned int, len, sizeof(uf));
^1da177e4c3f41 Linus Torvalds  2005-04-16  1974  		if (copy_to_user(optval, &uf, len))
cedc5469778846 Marcel Holtmann 2012-02-20  1975  			err = -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1976  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1977  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1978  	default:
cedc5469778846 Marcel Holtmann 2012-02-20  1979  		err = -ENOPROTOOPT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1980  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1981  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1982  
cedc5469778846 Marcel Holtmann 2012-02-20  1983  done:
cedc5469778846 Marcel Holtmann 2012-02-20  1984  	release_sock(sk);
cedc5469778846 Marcel Holtmann 2012-02-20  1985  	return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1986  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1987  

:::::: The code at line 1931 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
