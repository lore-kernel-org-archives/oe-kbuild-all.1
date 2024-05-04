Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0898289C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 20:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714852851; cv=none; b=Y7wN+v59fGOpjBhq66HPzul0+tkqdXA+fUPX4xxKr3QP4xeYOq98N+XAazXGtTCdKOj6nrNQbBLCSSKXMtDFAw9Eo7YrMhCy3CXS9P48tXQnE9Hc7oTO0Dd8n37K0mPysAkeCwgbbbHRLnWDaQsMG43akSRH0UgEd4Cv2W+faeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714852851; c=relaxed/simple;
	bh=i1TA1xp2etN08w3JdtDYisB5vD0j8agHbXlWgWTe1Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bWwNiud2VaAYF7PLQ/Kkdr1CR30oYEDaxzOGpkAE3dhXcR1cFiV5/fbkFex8asHQaWikn4Uv4KAWnmcuxLHQxDwpR9fUUHAYwXbuuC2sjvJI8rj3hAPa09yGR8DNiTsTQHkWqKTsNArtqX+qK7e/Q3aATysH89aJ2hUoODdwt3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCTCoVIJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCTCoVIJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714852849; x=1746388849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i1TA1xp2etN08w3JdtDYisB5vD0j8agHbXlWgWTe1Qo=;
  b=KCTCoVIJTHaATxO6vPFgsPgqJCtMIr4C/BsGPgnDnAMZPoRni8RGy53c
   zrjQL81cb736Zm3tzuCjimkYO5H1KYoM1mXt0D5fED6kezXWc7rt4MD0Y
   pqSlMrBPqaIKIISrdVkqJ8Ai63PNJECHEaDh0qIBMWD8FWqOzdWoka+oO
   0nF8aKzW+/6Qq/onrGGpZNvyCoJ/VZBKWOzw+zvtnVYWMnOrCqUlQVHmF
   CPEFuyGJpMcEz0Gr7bzhrIMRx1TBql/gDQwvPq5UX0MenFdxu+r+TsajZ
   EPZRcmLVv+XLOPJcdM2T5nB8XUtwCoFGZ0ft+JP+3Vb4n/lVfEMnD1L8X
   g==;
X-CSE-ConnectionGUID: I2uNqod8T1m1q1tSDj+uTQ==
X-CSE-MsgGUID: ZnPYoosVRqeFlxCEhRuAuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14447269"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="14447269"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 13:00:48 -0700
X-CSE-ConnectionGUID: Yo5Iudx+SfezDb7ykv3uMg==
X-CSE-MsgGUID: CS1hSfNqRxWFcFq1WSDmzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="32570265"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 May 2024 13:00:47 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3LYq-000D8i-2S;
	Sat, 04 May 2024 20:00:44 +0000
Date: Sun, 5 May 2024 03:59:47 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm-ppc@vger.kernel.org
Subject: [agraf-2.6:kvm-kho-gmem-test 24/27] drivers/misc/fdbox.c:504:47:
 warning: initialization discards 'const' qualifier from pointer target type
Message-ID: <202405050305.G2gWY32o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/agraf/linux-2.6.git kvm-kho-gmem-test
head:   9a58862a298a63bad21d05191e28b857063bb9dc
commit: eac026594b9dc0e92a0093a3443b9bc973be99a4 [24/27] XXX WIP
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240505/202405050305.G2gWY32o-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050305.G2gWY32o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050305.G2gWY32o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/fdbox.c: In function 'fdbox_kho_recover':
>> drivers/misc/fdbox.c:504:47: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     504 |                                 ulong *link = fdt_getprop(fdt, fd, "link", &l);
         |                                               ^~~~~~~~~~~


vim +/const +504 drivers/misc/fdbox.c

   448	
   449	static void fdbox_kho_recover(void)
   450	{
   451		const void *fdt = kho_get_fdt();
   452		const char *path = "/fdbox";
   453		int fdbox, box, fd;
   454		int err;
   455	
   456		/* Not a KHO boot */
   457		if (!fdt)
   458			return;
   459	
   460		fdbox = fdt_path_offset(fdt, path);
   461		if (fdbox < 0) {
   462			pr_debug("Could not find '%s' in DT", path);
   463			return;
   464		}
   465	
   466		err = fdt_node_check_compatible(fdt, fdbox, "fdbox-v1");
   467		if (err) {
   468			char p[256] = "";
   469			fdt_get_path(fdt, fdbox, p, sizeof(p) - 1);
   470			pr_warn("Node '%s' has invalid compatible", p);
   471			return;
   472		}
   473	
   474		fdt_for_each_subnode(box, fdt, fdbox) {
   475			struct fdbox_create_box create_box = {
   476				.flags = 0,
   477			};
   478			struct box *new_box;
   479	
   480			strncpy(create_box.name, fdt_get_name(fdt, box, NULL), sizeof(create_box.name) - 1);
   481	
   482			err = fdt_node_check_compatible(fdt, box, "fdbox,box-v1");
   483			if (err) {
   484				char p[256] = "";
   485				fdt_get_path(fdt, box, p, sizeof(p) - 1);
   486				pr_warn("Node '%s' has invalid compatible", p);
   487				continue;
   488			}
   489	
   490			err = _fdbox_create_box(&create_box, &new_box);
   491			if (err) {
   492				char p[256] = "";
   493				fdt_get_path(fdt, box, p, sizeof(p) - 1);
   494				pr_warn("Node '%s' could not spawn", p);
   495				continue;
   496			}
   497	
   498			new_box->wrapped = true;
   499			
   500			fdt_for_each_subnode(fd, fdt, box) {
   501				if (!fdt_node_check_compatible(fdt, fd, "fdbox,fd-v1")) {
   502					int l;
   503					struct box_dangle *dangle;
 > 504					ulong *link = fdt_getprop(fdt, fd, "link", &l);
   505					struct fdbox_fd put_fd = {
   506						.flags = 0,
   507						.fd = -1,
   508					};
   509					struct box_fd *box_fd;
   510	
   511					strncpy(put_fd.name, fdt_get_name(fdt, fd, NULL), sizeof(put_fd.name) - 1);
   512	
   513					if (!link || l != sizeof(ulong))
   514						continue;
   515					dangle = find_dangle(*link);
   516					box_fd = fdbox_put_file(new_box, &put_fd, dangle->file);
   517					if (!box_fd)
   518						continue;
   519					list_del(&dangle->next);
   520				} else {
   521					char p[256] = "";
   522					fdt_get_path(fdt, fd, p, sizeof(p) - 1);
   523					pr_warn("Node '%s' has invalid compatible", p);
   524				}
   525			}
   526		}
   527	}
   528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
