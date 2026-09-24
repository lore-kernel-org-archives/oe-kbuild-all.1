Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2631C4BC029
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 19:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278791; cv=none; b=O654sEBQWNwgsQBLIyzM8SoEZtX9+SlY+2j8DRykiPXnUn8RdC9vY2zOt3gh9hrlK7uepQp6fbyRY8GwGzkSaUnl2EnrvAgdIZ8wezFfwApAKrEENMwo4H9SaAkDUby5UgLIxjWv6CfaJV3MEjLfn1E+yn7aK+qvkU5kieik26o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278791; c=relaxed/simple;
	bh=cdOH0TQFx2/yle8Oxw+LbUiqtgMIOe8sbY3XW9lC+1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lnE3AXFd+czR+vl6rx9I5pGAnrP1i0RliUi/zg5J7rXvxcKFSD1pHENV9t0fv09Hd8etLRRLIsv/1hu7oD6hE7eGXCh3AelIsduD0sTamMkjfPoErCYmjrwy/OxtcvkIWezfqvo+45NGg9hazvJfdOgOXUbXhFTyYDbAb0obdDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4zrpKXL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4zrpKXL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so1128655e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790278786; x=1790883586; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVpUm2vxAmiJvxOEbkoDqlOy/q982BD2NVBKlRMKmW4=;
        b=Y4zrpKXLdUCfX8+8n0F1UUbi/SbzQadWAp9ENWrGrsHRnBWJha89pvQu1JGrVYbyrw
         y9vfs62gtjDb8BVEWNU3LdRFTHqPkO+HHLs6YgefcfZFuPZV6HfEEchmA60PIqWtO2i5
         s+K4dMxaiADORQb/thg7eityQUJQY38Uv5LgUk3y2FcYeq/DIehaAOjAhz7dDA87J3IU
         RHdzbNavlL0nS5BPmEk3JPELAlW61yciqcX6rvP/7daaa2uz1Xhvkg9g8lbHYow0y1YH
         KCLT5yx1IYQqwscfdeToHMGpm/iiQ2Ig6wIBz6VeA+yU+6IByNEnbEl69BW7GHtFGOv7
         HMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278786; x=1790883586;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVpUm2vxAmiJvxOEbkoDqlOy/q982BD2NVBKlRMKmW4=;
        b=tt8BgI5QS1oNX6RuBISZ8fWWcD+OuTG0jJmb97aNfVs/6kTc2vZiTTK2CFKgasgaZX
         agI3G5I/hd4M1ib0Lt4r0VEDiaH8E3ZM9lFhhmUF/aRBFMziKw8uyTe3QmhcNmp3mzTh
         ahlfHHp8tFN47E70yzYW/m/xHTJvKHqA6pTj4+YMqHOMPd6Ac0pnVzGdsWIVtyNp7sg3
         y8qZa4rXUo9waBXAXceFDR1GhxhY+ELnDJhAC7d03r5Sz5tL33EDUtjMFQ13zMiE5QYa
         tDI5PD43nFrpDB8ksZvKfjnaeeIsDWH/SNJ6FC1XB55GQGIGpNac2lLDHk/qaHO8/6NY
         6u+A==
X-Forwarded-Encrypted: i=1; AKwUvBy1XclJCvh9bh7sNmuZ9s/98d/Hem7bf54oH+D1lsURsePSYnYX0kk8selF8Ey4bVCRfC8DEUmfO13gBRgb@lists.linux.dev
X-Gm-Message-State: AFuF++lbNjrXCn1laig5Sj9aoUweHuylox7scklqFXajroz9YdVJMAyY
	Zyrz12kac/uynsqUvb/GSYuw2OSpZQqvC7MfnadL1H1TmpbsFMisc29I
X-Gm-Gg: AYBFou2s/sZP+WP4iihWew1Q6Fp7+7XLhAyMFTYMz1hYxk+5JNsxer1JOzKM3MEC4KP
	ZKTv8CxfmGEZhQQa7EB25BGFECVjfO9vAQOvopVPUjBt6pKhuD6oVnlT49m7jMeeVPCDFEUbIB+
	jlniPfHlhc2V4XGDNPeZ2NH6Hlt4bo7XbddzJd9ygMe5rZS/ksyFpNjifdaTuCFIEihky+SQdNr
	sMp08E0bPO6hyE+L0rtKkrgedHs1c4jKwFU3vm7yjkxBGGapV+c2Bxu0+pNjIyWwSihRZ9Tp2F4
	qbibuZJQU7nrwbLgmPNIvPir5fD5UBxhgyJFenIxD4YoHx8lxo4OhuVwKm0tLMnuVJN8XFFQ/wx
	kUusWeJTe8aoN298FuQ+F72UjzniLEpXtCSCa6COoICD8nJVYY4XLz/tBnKJDD+NO8V1721KRBS
	gW2Yue/CTpq5LzChVjlSrmzdOXYu/5xB3j2/vs1ZQ8lGQZcSmXpIwoOHyQ7webMF3fqP8=
X-Received: by 2002:a05:600c:468f:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49fe66f4fc6mr58492795e9.25.1790278785696;
        Thu, 24 Sep 2026 12:39:45 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff023f12esm1758795e9.0.2026.09.24.12.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:39:44 -0700 (PDT)
Date: Thu, 24 Sep 2026 22:39:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/xen/gntdev.c:817 gntdev_get_page() warn: mask and shift to
 zero: expr='(addr & ~(~((1 << 12) - 1))) >> 12'
Message-ID: <202609241805.VsLzGPLn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62f4c998b297cf233997a2b4cd6fc2d2df0319c9
commit: d70242427110123b65c095594eb74a703d3af156 ARM: rework ARM11 CPU selection logic
config: arm-randconfig-r2200-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241805.VsLzGPLn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d70242427110 ("ARM: rework ARM11 CPU selection logic")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609241805.VsLzGPLn-lkp@intel.com/

smatch warnings:
drivers/xen/privcmd.c:488 privcmd_ioctl_mmap_batch() warn: potential user controlled sizeof overflow 'm.num * 8' '0-u32max * 8'
drivers/xen/privcmd.c:495 privcmd_ioctl_mmap_batch() warn: potential user controlled sizeof overflow 'm.num * (4)' '0-u32max * 4'

vim +817 drivers/xen/gntdev.c
   470  static long privcmd_ioctl_mmap_batch(
   471          struct file *file, void __user *udata, int version)
   472  {
   473          struct privcmd_data *data = file->private_data;
   474          int ret;
   475          struct privcmd_mmapbatch_v2 m;
   476          struct mm_struct *mm = current->mm;
   477          struct vm_area_struct *vma;
   478          unsigned long nr_pages;
   479          LIST_HEAD(pagelist);
   480          struct mmap_batch_state state;
   481  
   482          switch (version) {
   483          case 1:
   484                  if (copy_from_user(&m, udata, sizeof(struct privcmd_mmapbatch)))
   485                          return -EFAULT;
   486                  /* Returns per-frame error in m.arr. */
   487                  m.err = NULL;
   488                  if (!access_ok(m.arr, m.num * sizeof(*m.arr)))
                                              ^^^^^^^^^^^^^^^^^^^^^^

   489                          return -EFAULT;
   490                  break;
   491          case 2:
   492                  if (copy_from_user(&m, udata, sizeof(struct privcmd_mmapbatch_v2)))
   493                          return -EFAULT;
   494                  /* Returns per-frame error code in m.err. */
   495                  if (!access_ok(m.err, m.num * (sizeof(*m.err))))
                                              ^^^^^^^^^^^^^^^^^^^^^^^
These integer overflow bugs are from 2012, but I guess your patch exposed
the arm32 build to the zero day bot.  The bugs only affect 32bit systems.

   496                          return -EFAULT;
   497                  break;
   498          default:
   499                  return -EINVAL;
   500          }
   501  
   502          /* If restriction is in place, check the domid matches */
   503          if (data->domid != DOMID_INVALID && data->domid != m.dom)
   504                  return -EPERM;
   505  


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

