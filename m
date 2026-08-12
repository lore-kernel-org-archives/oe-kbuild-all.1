Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79387468C1F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786557524; cv=none; b=cThscCeBB1NfO5F55ewYSYkU6BfIytm9EceQBDkKv57QXnxYHBzBn/dWoFqBdr8lwhRkSzm1F1StUe2I2r9Ww1XrSND0Rd8AQJW3klgZlmdtH0RRDhsKQ795nFFVx0yFsbbc5NivnzhgS0bKcdStuHaAHMz+m78EDVFIqXgqtBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786557524; c=relaxed/simple;
	bh=98f6bgwUufdeND1aPL7htI6hElSi0x0nB87A/qZBbqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DxZJr4NumG42zou77AufOiOuTXfdjlIrrVzaZzXX0RGeMPbHeKUucy8HC3qF/HfhLwiHuuUXEm2zb+szvvN1q/n1/RgXHJYsMsbRfF6QNgldg1gEH85Uuik8jdb340kqa4hAF8pHBC9LTw3F4puuv/Q5nybhbWF5A3IYIEdPM3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMNbLxuQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMNbLxuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786557523; x=1818093523;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=98f6bgwUufdeND1aPL7htI6hElSi0x0nB87A/qZBbqU=;
  b=IMNbLxuQfqYSHLYZOyPjsnOsOrygtdnQwjsF3uBBGY1N72d6J+VytOXL
   2CSyf93hUlGh+3MDGWB70FNuyWtp/dErZpha7Td3PPw+6Yhlzcee81gJE
   IgsOklppjHHyQ5XA3Le7urDSfSMxWRZSWjlBVVJO3Ak0a8PtJ1kElwjcI
   Mxhu7YsoCzTzAt/W1Eg1EG/JzL3xPg06lWWsqmCWra2fKIpK6K4Xooq0h
   8KLI9eVPkY7oyZO7jqo7RvnGhoxAqXgRs6YfWVDj2xLJCg5D+HxXktC6y
   kU4a27DMl5iBvvY+R3auyMNa/ALdfyOHSwxKND/1JP8Wawd+MItk4DsI/
   A==;
X-CSE-ConnectionGUID: gp4ZE+8rT/G9sp6WlvUn6g==
X-CSE-MsgGUID: 7vLbe9Y5QlaE1hscWP2IIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97706452"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="97706452"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 10:58:42 -0700
X-CSE-ConnectionGUID: PXt3v6O4QCW3zjPOCCJOxw==
X-CSE-MsgGUID: 1rijUVtaREWCy3N9fyA0jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="259882293"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2026 10:58:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuDDq-00000000RHy-1U0f;
	Wed, 12 Aug 2026 17:58:38 +0000
Date: Thu, 13 Aug 2026 01:57:35 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:headers 2/7]
 drivers/char/agp/uninorth-agp.c:190:17: error: implicit declaration of
 function 'flush_dcache_range'; did you mean 'flush_hash_range'?
Message-ID: <202608130137.DAAlxQ7p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/willy/pagecache headers
head:   5a75fff46226e59e4c4d87c36f7de79ec4cabdb4
commit: 992dc5cd4c8b4853d34f45ae003dc52b8ae77f80 [2/7] agp: Remove pagemap =
includes
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260=
813/202608130137.DAAlxQ7p-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260813/202608130137.DAAlxQ7p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130137.DAAlxQ7p-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   drivers/char/agp/uninorth-agp.c: In function 'uninorth_insert_memory':
>> drivers/char/agp/uninorth-agp.c:190:17: error: implicit declaration of f=
unction 'flush_dcache_range'; did you mean 'flush_hash_range'? [-Wimplicit-=
function-declaration]
     190 |                 flush_dcache_range((unsigned long)__va(page_to_p=
hys(mem->pages[i])),
         |                 ^~~~~~~~~~~~~~~~~~
         |                 flush_hash_range
   drivers/char/agp/uninorth-agp.c: In function 'uninorth_create_gatt_table=
':
   drivers/char/agp/uninorth-agp.c:372:13: warning: variable 'size' set but=
 not used [-Wunused-but-set-variable=3D]
     372 |         int size;
         |             ^~~~


vim +190 drivers/char/agp/uninorth-agp.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  148 =20
37580f3f229fa7 Michel D=C3=A4nzer  2009-12-06  149  static int uninorth_ins=
ert_memory(struct agp_memory *mem, off_t pg_start, int type)
^1da177e4c3f41 Linus Torvalds 2005-04-16  150  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  151  	int i, num_entries;
^1da177e4c3f41 Linus Torvalds 2005-04-16  152  	void *temp;
^1da177e4c3f41 Linus Torvalds 2005-04-16  153  	u32 *gp;
62369028c7e203 Michel D=C3=A4nzer  2009-06-15  154  	int mask_type;
^1da177e4c3f41 Linus Torvalds 2005-04-16  155 =20
62369028c7e203 Michel D=C3=A4nzer  2009-06-15  156  	if (type !=3D mem->typ=
e)
62369028c7e203 Michel D=C3=A4nzer  2009-06-15  157  		return -EINVAL;
62369028c7e203 Michel D=C3=A4nzer  2009-06-15  158 =20
62369028c7e203 Michel D=C3=A4nzer  2009-06-15  159  	mask_type =3D agp_brid=
ge->driver->agp_type_to_mask_type(agp_bridge, type);
62369028c7e203 Michel D=C3=A4nzer  2009-06-15  160  	if (mask_type !=3D 0) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  161  		/* We know nothing of memo=
ry types */
^1da177e4c3f41 Linus Torvalds 2005-04-16  162  		return -EINVAL;
62369028c7e203 Michel D=C3=A4nzer  2009-06-15  163  	}
62369028c7e203 Michel D=C3=A4nzer  2009-06-15  164 =20
3fc3a6b476581d Michel D=C3=A4nzer  2009-12-06  165  	if (mem->page_count =
=3D=3D 0)
3fc3a6b476581d Michel D=C3=A4nzer  2009-12-06  166  		return 0;
3fc3a6b476581d Michel D=C3=A4nzer  2009-12-06  167 =20
3fc3a6b476581d Michel D=C3=A4nzer  2009-12-06  168  	temp =3D agp_bridge->c=
urrent_size;
3fc3a6b476581d Michel D=C3=A4nzer  2009-12-06  169  	num_entries =3D A_SIZE=
_32(temp)->num_entries;
3fc3a6b476581d Michel D=C3=A4nzer  2009-12-06  170 =20
^1da177e4c3f41 Linus Torvalds 2005-04-16  171  	if ((pg_start + mem->page_c=
ount) > num_entries)
^1da177e4c3f41 Linus Torvalds 2005-04-16  172  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  173 =20
^1da177e4c3f41 Linus Torvalds 2005-04-16  174  	gp =3D (u32 *) &agp_bridge-=
>gatt_table[pg_start];
^1da177e4c3f41 Linus Torvalds 2005-04-16  175  	for (i =3D 0; i < mem->page=
_count; ++i) {
61cf059325a309 Jerome Glisse  2010-04-20  176  		if (gp[i] !=3D scratch_val=
ue) {
e3cf69511a2c53 Bjorn Helgaas  2008-07-30  177  			dev_info(&agp_bridge->dev=
->dev,
37580f3f229fa7 Michel D=C3=A4nzer  2009-12-06  178  				 "uninorth_insert_m=
emory: entry 0x%x occupied (%x)\n",
^1da177e4c3f41 Linus Torvalds 2005-04-16  179  				 i, gp[i]);
^1da177e4c3f41 Linus Torvalds 2005-04-16  180  			return -EBUSY;
^1da177e4c3f41 Linus Torvalds 2005-04-16  181  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  182  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  183 =20
^1da177e4c3f41 Linus Torvalds 2005-04-16  184  	for (i =3D 0; i < mem->page=
_count; i++) {
37580f3f229fa7 Michel D=C3=A4nzer  2009-12-06  185  		if (is_u3)
07613ba2f464f5 Dave Airlie    2009-06-12  186  			gp[i] =3D (page_to_phys(m=
em->pages[i]) >> PAGE_SHIFT) | 0x80000000UL;
37580f3f229fa7 Michel D=C3=A4nzer  2009-12-06  187  		else
37580f3f229fa7 Michel D=C3=A4nzer  2009-12-06  188  			gp[i] =3D	cpu_to_le3=
2((page_to_phys(mem->pages[i]) & 0xFFFFF000UL) |
37580f3f229fa7 Michel D=C3=A4nzer  2009-12-06  189  					    0x1UL);
07613ba2f464f5 Dave Airlie    2009-06-12 @190  		flush_dcache_range((unsign=
ed long)__va(page_to_phys(mem->pages[i])),
07613ba2f464f5 Dave Airlie    2009-06-12  191  				   (unsigned long)__va(p=
age_to_phys(mem->pages[i]))+0x1000);
^1da177e4c3f41 Linus Torvalds 2005-04-16  192  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  193  	mb();
^1da177e4c3f41 Linus Torvalds 2005-04-16  194  	uninorth_tlbflush(mem);
^1da177e4c3f41 Linus Torvalds 2005-04-16  195 =20
^1da177e4c3f41 Linus Torvalds 2005-04-16  196  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  197  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  198 =20

:::::: The code at line 190 was first introduced by commit
:::::: 07613ba2f464f59949266f4337b75b91eb610795 agp: switch AGP to use page=
 array instead of unsigned long array

:::::: TO: Dave Airlie <airlied@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
