Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F6521773F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 17:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772558329; cv=pass; b=TlpOVYoy2P5+WmkH5k6kqyQnXM855I7tkyGi8dQlj8FETUXYchtMSeLR32f5FJEVL3mr6TbGaRHNGCuSeZotc0qBDsC/48r/lwKogNV7QBdd2Fd/bG+eqLUg0jJ1621l/8Fp0fkE0Og+ZegxZaySNwbvfxPCQH6sfCj2THuvQGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772558329; c=relaxed/simple;
	bh=M00ZxH9NQtIGmBwxo4PARuqjBVD/RSWQ+jaKn3U1FXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pLjLNRZdHowdxYchwEajk4c6i4uHVevWy/Aqk/lIX94GuH9CumZ7A05dO1kWG74rblRBLEd7X5X9FpD645TYE702z7lMB+gs809qi5Z3eL8UcFSIOMqe63BQe9iHVHoIy92l7gCgTh9zoB39hM8ZhcEM0crKVHpf5AvrG37lxb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SryUWC3+; arc=pass smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SryUWC3+"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cbc593a67aso533918585a.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 03 Mar 2026 09:18:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772558326; cv=none;
        d=google.com; s=arc-20240605;
        b=iXKC4eVSa6q0xP44ewpmTQLRNELrCSjvsLI7OjTvN7GmlKQGLD302c6uC/ybQTNk+0
         5ryAIiVbs4SI4eIxgqkerY46opSiFz+tycK+VYp1N1uhptmPGl+LZrBpZoTMBjorLng4
         pGZTyGWmJVbzrxb3HigjXLD5DtwinrL1Otjn0l0r3B/GxEvN2FacnA3FMiAG/GoGl5e9
         xwWgaD5EegDGQ+9J4ZTRkWGk2r5Upc53zrN4T5RN7nMtgvs5Ygb6qT2PkWVW7I9FBCG/
         z3GDPLbrK38ACAzRE8SqTrQmwLeC6TSMgasttx+Whw8+wU4Us4GKYhDzBJFpHg2j9QVW
         chcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lI+H26YOBNt/1DoRS04AjyW78q1APVhvhlkjEdWFqfQ=;
        fh=QvwXmiC9BuEDPSnyyywu4JQPl8n3HyW148V2qOBsRE4=;
        b=D4xse2dLLJxfNCL1KTQtYFE27DJVBAs0m0SuOE5mJtArzkPrVJnw0GyNsQguHnyUK4
         3ZncLeTWNAozFeESoIODq5drdels2beJqqHbR5iXafN9TSnS+TUmFBjyG5QdFTIqRwGy
         N3m7FLVd+qk2QqkKVHo3sq3SIoZzxA8Ot7OesDDhKl9NNh3RXRRaE4kEWl640SupQyMz
         Z9DJsQA1jZZQ1x7r0FkFBdY6TqVjFho/wFOCdjKmeZbyG9hNUEs6ABxPWncry0048DFu
         nm+j1NxNWONGqHJvK6dGE50BWZ8C6ca1CwVpCgGX13mZluPy8E7M1ZCLi2LRWMnAIJ/H
         zhkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772558326; x=1773163126; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lI+H26YOBNt/1DoRS04AjyW78q1APVhvhlkjEdWFqfQ=;
        b=SryUWC3+8fgSY9PjCC8g3GyRCwtRqzr/IEEcJhUC6hok9pbI2Lw/dEEw8mWnwL46SE
         rx4vhmZgNrcW3zEkEunmZ3Tp5KOlGhUprScmEAEjYUWWqCmtsGrLNwLLa7Xo20KjCgrb
         cy/rh5MOGBeymry7N2sXgd9ygCxkupfn0I9kjd61+BzuA9Hk/mnwyBjJUffBSd7FKsuB
         SoHwUKX4e0hshnHq4KfOXqxn/yDbtcoQn3J1clP/Q7ytYUBM1KGKlEK19JpNC4wCRlbr
         NpgeZ7hm/99+dTaHcF8dvR+hDj5YhbRVzDRiHBKXJ9Sjru6wHPYWcm4MFIWImELkGnEg
         VzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772558326; x=1773163126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lI+H26YOBNt/1DoRS04AjyW78q1APVhvhlkjEdWFqfQ=;
        b=wDkqG5eMWIkllQ0rh20okACtzRaBYAZ0DKD931NFi6it9Zo0CAAjs1ACmUNYdvi/FY
         EuRe6Dd7Alb2cv3wfsxmuxkV7ASPIIxiLVk5FV6lkgslGhQrJHRR97rTrNHWldm1JsCY
         aVM8I4ghS/MmTpYoeZ8uV5ejqNgL1WEoHkH7IR/vqmpEqK9ZnnIRX1EX2rsjpADDN2ed
         PD7VGG4Wa6fSoppalTRUXbs2vzEtGXVF4zDX4GPubBm1LueVDSyuv32Do6Q/X4lEuORd
         KNVDQwzFAPcb+mPtCJOIRpg+PIZEZrgVUUkYjGUNp79AJlM1jxjro8mgvTIGqwBco1lD
         pDNA==
X-Forwarded-Encrypted: i=1; AJvYcCXiDeIo+lbMVxNXHzOryKSkRhhnPu5/Ro2lsil3AGoapXZ3A9sm0M+9eEpgglB1e+IWJFiEMIWJvhfMTFQE@lists.linux.dev
X-Gm-Message-State: AOJu0YwWOxuQywrTsVU2E09gcqrbPuIkIt6qZL2mu6Loxk+UHOCxW98a
	Dt5VV8gLNiPei5iEYCij6qayLkVVmMNlt/OhsOLspyFecBhy3LNnBCMrmSR9KNrFMJQpf1B7jmy
	fG6QjwWoHH1CtkhxbYx5dQT8djMLLABE=
X-Gm-Gg: ATEYQzw6QakwtGFv9uLWFWa4kE7byR3BlvJyGdgHD/Fr27PnnA8h4tS7zWN4/tY3Ef6
	QorJmH1f2bms/q4A1m80AxAQfN8bdPRRca0Hw8w71p3mvT/c3kMXBWgTrCqkh2fMsYq/Z441TCw
	3Kg3V9M6CfrzIV45H1LGT6ZbFjKJDXAQMC3kxDLev+Vme8dzTYyC9DbEytHKZO2PHP0Un9/pvGj
	QRs3iFeCjUSE9StWdTmLSQgLjJ7TZMFS+96g2pLK4IsmhPzSw1iQIdEo85sCU/x9O+tXp4XjyRx
	2w1D9Q==
X-Received: by 2002:a05:622a:1110:b0:501:459b:6138 with SMTP id
 d75a77b69052e-507529fcb92mr234290491cf.65.1772558325772; Tue, 03 Mar 2026
 09:18:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603031522.e4lroM3J-lkp@intel.com>
In-Reply-To: <202603031522.e4lroM3J-lkp@intel.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 3 Mar 2026 09:18:34 -0800
X-Gm-Features: AaiRm50-wckwwg-JvR3pctqSxXCAiq-ktkV4OkwZcSewRXuIOGxjrtAF36tEfhY
Message-ID: <CAJnrk1Zj=U7DkaQRRfbqqAUQ3+3R2hS6agtj5iOLKO5+ucBRmg@mail.gmail.com>
Subject: Re: [mszeredi-fuse:for-next 9/12] fs/fuse/dev.c:1818:43: warning:
 variable 'folio_offset' is uninitialized when used here
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	fuse-devel@lists.sourceforge.net, Miklos Szeredi <mszeredi@redhat.com>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>, "Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 6:36=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git=
 for-next
> head:   16c09ed4c4502027cdd1c9d285cc02657e9e2b72
> commit: db64b9107f146940606d512f1d6214323b905565 [9/12] fuse: simplify lo=
gic in fuse_notify_store() and fuse_retrieve()
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260303/20=
2603031522.e4lroM3J-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260303/202603031522.e4lroM3J-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603031522.e4lroM3J-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> fs/fuse/dev.c:1818:43: warning: variable 'folio_offset' is uninitializ=
ed when used here [-Wuninitialized]
>     1818 |                 nr_bytes =3D min(num, folio_size(folio) - foli=
o_offset);
>          |                                                         ^~~~~~=
~~~~~~
>    include/linux/minmax.h:105:41: note: expanded from macro 'min'
>      105 | #define min(x, y)       __careful_cmp(min, x, y)
>          |                                               ^
>    include/linux/minmax.h:98:28: note: expanded from macro '__careful_cmp=
'
>       98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE=
_ID(y_))
>          |                                   ^
>    include/linux/minmax.h:92:28: note: expanded from macro '__careful_cmp=
_once'
>       92 |         auto ux =3D (x); auto uy =3D (y);                   \
>          |                                   ^
>    fs/fuse/dev.c:1809:28: note: initialize the variable 'folio_offset' to=
 silence this warning
>     1809 |                 unsigned int folio_offset;
>          |                                          ^
>          |                                           =3D 0
>    1 warning generated.
>
>
> vim +/folio_offset +1818 fs/fuse/dev.c
>
> 3b463ae0c6264f John Muir      2009-05-31  1761
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1762  static int fuse_notify_st=
ore(struct fuse_conn *fc, unsigned int size,
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1763                           =
    struct fuse_copy_state *cs)
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1764  {
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1765          struct fuse_notif=
y_store_out outarg;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1766          struct inode *ino=
de;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1767          struct address_sp=
ace *mapping;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1768          u64 nodeid;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1769          int err;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1770          unsigned int num;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1771          loff_t file_size;
> db64b9107f1469 Joanne Koong   2026-01-20  1772          loff_t pos;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1773          loff_t end;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1774
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1775          if (size < sizeof=
(outarg))
> 60e1579a0dcf2c Miklos Szeredi 2025-09-01  1776                  return -E=
INVAL;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1777
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1778          err =3D fuse_copy=
_one(cs, &outarg, sizeof(outarg));
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1779          if (err)
> 60e1579a0dcf2c Miklos Szeredi 2025-09-01  1780                  return er=
r;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1781
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1782          if (size - sizeof=
(outarg) !=3D outarg.size)
> 60e1579a0dcf2c Miklos Szeredi 2025-09-01  1783                  return -E=
INVAL;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1784
> 65161470f95bb5 Joanne Koong   2026-01-20  1785          if (outarg.offset=
 >=3D MAX_LFS_FILESIZE)
> 65161470f95bb5 Joanne Koong   2026-01-20  1786                  return -E=
INVAL;
> 65161470f95bb5 Joanne Koong   2026-01-20  1787
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1788          nodeid =3D outarg=
.nodeid;
> db64b9107f1469 Joanne Koong   2026-01-20  1789          pos =3D outarg.of=
fset;
> db64b9107f1469 Joanne Koong   2026-01-20  1790          num =3D min(outar=
g.size, MAX_LFS_FILESIZE - pos);
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1791
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1792          down_read(&fc->ki=
llsb);
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1793
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1794          err =3D -ENOENT;
> fcee216beb9c15 Max Reitz      2020-05-06  1795          inode =3D fuse_il=
ookup(fc, nodeid,  NULL);
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1796          if (!inode)
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1797                  goto out_=
up_killsb;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1798
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1799          mapping =3D inode=
->i_mapping;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1800          file_size =3D i_s=
ize_read(inode);
> db64b9107f1469 Joanne Koong   2026-01-20  1801          end =3D pos + num=
;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1802          if (end > file_si=
ze) {
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1803                  file_size=
 =3D end;
> 65161470f95bb5 Joanne Koong   2026-01-20  1804                  fuse_writ=
e_update_attr(inode, file_size, num);
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1805          }
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1806
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1807          while (num) {
> 8807f117be9d15 Josef Bacik    2024-09-30  1808                  struct fo=
lio *folio;
> c91440c89fbd9d Joanne Koong   2025-05-12  1809                  unsigned =
int folio_offset;
> c91440c89fbd9d Joanne Koong   2025-05-12  1810                  unsigned =
int nr_bytes;
> db64b9107f1469 Joanne Koong   2026-01-20  1811                  pgoff_t i=
ndex =3D pos >> PAGE_SHIFT;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1812
> 8807f117be9d15 Josef Bacik    2024-09-30  1813                  folio =3D=
 filemap_grab_folio(mapping, index);
> 8807f117be9d15 Josef Bacik    2024-09-30  1814                  err =3D P=
TR_ERR(folio);
> 8807f117be9d15 Josef Bacik    2024-09-30  1815                  if (IS_ER=
R(folio))
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1816                          g=
oto out_iput;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1817
> 0f5bb0cfb0b40a David Laight   2025-11-19 @1818                  nr_bytes =
=3D min(num, folio_size(folio) - folio_offset);
> db64b9107f1469 Joanne Koong   2026-01-20  1819                  folio_off=
set =3D offset_in_folio(folio, pos);
> c91440c89fbd9d Joanne Koong   2025-05-12  1820
> c91440c89fbd9d Joanne Koong   2025-05-12  1821                  err =3D f=
use_copy_folio(cs, &folio, folio_offset, nr_bytes, 0);
> db64b9107f1469 Joanne Koong   2026-01-20  1822                  if (!foli=
o_test_uptodate(folio) && !err && folio_offset =3D=3D 0 &&
> c91440c89fbd9d Joanne Koong   2025-05-12  1823                      (nr_b=
ytes =3D=3D folio_size(folio) || file_size =3D=3D end)) {
> c91440c89fbd9d Joanne Koong   2025-05-12  1824                          f=
olio_zero_segment(folio, nr_bytes, folio_size(folio));
> 8807f117be9d15 Josef Bacik    2024-09-30  1825                          f=
olio_mark_uptodate(folio);
> 3c0da3d163eb32 Jann Horn      2024-08-06  1826                  }
> 8807f117be9d15 Josef Bacik    2024-09-30  1827                  folio_unl=
ock(folio);
> 8807f117be9d15 Josef Bacik    2024-09-30  1828                  folio_put=
(folio);
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1829
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1830                  if (err)
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1831                          g=
oto out_iput;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1832
> db64b9107f1469 Joanne Koong   2026-01-20  1833                  pos +=3D =
nr_bytes;
> c91440c89fbd9d Joanne Koong   2025-05-12  1834                  num -=3D =
nr_bytes;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1835          }
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1836
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1837          err =3D 0;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1838
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1839  out_iput:
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1840          iput(inode);
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1841  out_up_killsb:
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1842          up_read(&fc->kill=
sb);
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1843          return err;
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1844  }
> a1d75f258230b7 Miklos Szeredi 2010-07-12  1845
>
> :::::: The code at line 1818 was first introduced by commit
> :::::: 0f5bb0cfb0b40a31d2fe146ecbef5727690fa547 fs: use min() or umin() i=
nstead of min_t()
>
> :::::: TO: David Laight <david.laight.linux@gmail.com>
> :::::: CC: Christian Brauner <brauner@kernel.org>
>

It looks like there was a merge conflict between David's commit and
the fuse_notify_store() cleanup commit [1], where the line orders

> 0f5bb0cfb0b40a David Laight   2025-11-19 @1818                  nr_bytes =
=3D min(num, folio_size(folio) - folio_offset);
> db64b9107f1469 Joanne Koong   2026-01-20  1819                  folio_off=
set =3D offset_in_folio(folio, pos);

got switched around. These two lines should be swapped.

Are you able to fix this up locally Miklos or do you prefer that a
fixup patch be sent for this?

Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/20260120224449.1847176-3-joannelk=
oong@gmail.com/

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
