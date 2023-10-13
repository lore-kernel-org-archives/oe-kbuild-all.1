Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2FE219E1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 16:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZm4opOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697215556; x=1728751556;
  h=date:from:to:cc:subject:message-id;
  bh=ruPWCFz5vyjfyCqeCE0CYIMlDapGmJh9dD1S+Q2GDgQ=;
  b=lZm4opOTfCAIHE8x6xPbWmgdxhxZA26z3ih5a3xeQ0OVDOlzOV+Lpds6
   k5ot//tI4CNRAc5R8X28ZI+ZiJvgSWJpvtjmrEL4vDypl1eSUnNeGiMnW
   xmfzfb6GXMRdWsXX0PPVkEgv8GEoY+ams5MMlv6i6FYDjkQxpLHXLweQr
   sf27uDOaFo51Jg0V6+Sp0yEH3DgzG8td1eJFbcvVWFiSZ1KMDRMCeLhTa
   rXwttVIw7Z0T7n8PFG0nXxcwY/lMpTpeBKFvfE+fgGLxmdCaAXFQ0z69m
   BNuWVi0ix3VQiBJD2cnvv6Mc4h5bs42GrNHYB6n+QH9S7IRl/obeip9YU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="375570607"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="375570607"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 09:45:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="731419054"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="731419054"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Oct 2023 09:45:54 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrLIN-00059I-2T;
	Fri, 13 Oct 2023 16:45:51 +0000
Date: Sat, 14 Oct 2023 00:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+106 bytes kernel size regression] [i386-tinyconfig]
 [59269727cb] fs: factor out backing_file_splice_{read,write}() helpers
Message-ID: <20231013164541.N1mm_%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +106 bytes kernel size regression due to commit:

commit: 59269727cbe2a0c80fea4007280db65330006f1c (fs: factor out backing_file_splice_{read,write}() helpers)
https://github.com/amir73il/linux fuse-backing-fd


Details as below (size data is obtained by `nm --size-sort vmlinux`):

03c0eb33: fs: factor out backing_file_{read,write}_iter() helpers
59269727: fs: factor out backing_file_splice_{read,write}() helpers

+--------------------------------+----------+----------+-------+
|             symbol             | 03c0eb33 | 59269727 | delta |
+--------------------------------+----------+----------+-------+
| nm.T.backing_file_write_iter   | 55       | 361      | 306   |
| nm.T.backing_file_splice_write | 0        | 93       | 93    |
| nm.T.backing_file_splice_read  | 0        | 83       | 83    |
| bzImage                        | 522688   | 522752   | 64    |
| nm.t.backing_file_write_iter   | 376      | 0        | -376  |
+--------------------------------+----------+----------+-------+



Thanks

