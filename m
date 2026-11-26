Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672873;
	b=CHHozKvKk/+Om7OWAunlrcnLVfMf8JUKx9TuOAdskWdUAjTkM50gIM155yUrWMVGlaQs
	 Ls43pmNFFCiWFMkCOHBoxEowdTHd8h9FUn0oDX8o8XJSzW9TgOPgo86DbPkW2O4V25xQo
	 AoORvD/qteDkMOtvv2+J8m5l5d4Ud9oaWQ7ha2HkKjXeCoUQNkYYL9nJMZh7Rf+oNsUkX
	 pjDZY20pMmJF3rCovGtq9JgfMBHGkFLrJBjF3YMuhq7HUaimxDWBBo3gm7qJuSK9zMZN/
	 ZR1w5+Xn69JCTrctPdBBYYZoHrcHVjOR28iG+iqhukV+ktdnEidqRX+mXDDjpwG5CBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=kDxGg7QUI2SeoicQQtdwgwJtguc6iCG2f3OmUmwXw+U=;
	b=BphxVvxKddRDZ0DU+brxaYb6B306a0KZN7MDkzODRRfmqUVekykL8142IR0yZN8NElYQ
	 6pi0QfL69A2ZetKBkvi8r3/l/zX7TixnOlQSkeEJ50Og9N40BMzGVWYZl4PuFYO0yZ9XA
	 cMD+WyRndKXisZvQs1eLFpagOlAOnYMYxK3d0qxoCzIqZd2yy0I5kUHT4VtRiLH/4UhGK
	 UDKYLPalACKrakoPQKDrjn/XZ+1k4reBgmKz89eJcSZYZ6yCs/FXMhMmChZ4DfKYvhIgs
	 C5orN/KCjEgNzopJUAFh1ufZOYs4dLR0GtmjaaguVUhXGA1st5AIakb6MPlnuTyit8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tR7gOVn4;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACDC606A681
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 06:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ACDC606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tR7gOVn4
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so61583895e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 22:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672871; x=1796277671; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDxGg7QUI2SeoicQQtdwgwJtguc6iCG2f3OmUmwXw+U=;
        b=tR7gOVn4eK9Swi5iizzt3vVF2qtKaadV2Ed6sSBtuZepxHbD64OqwgjdwXeC8Jxqlk
         SbcCYF9CMEKNlztbH/vu/dWwuBe7isJVkCM32oVeqs/YXLBydMzMYarFhj4ULFQA1rhB
         H/UI0g0xK/jMKm3dsSnDCyOQ+aMyw05MPx1IibtMVKR2K4sM8Z68KVFlZS8YyrtFZqtQ
         GOk5wEiXmebVa8rKfoUyudWb4+lbS/oso4plR3qapZThVf9I5kNPSX79j7VizHJ9798p
         lxMTSMmKAla4/yQgsxM8DpDBBG/4kQ/z2WLXKmSg/vVezSe+zx/iNDiEVF6QiGXjNS/q
         A0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672871; x=1796277671;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kDxGg7QUI2SeoicQQtdwgwJtguc6iCG2f3OmUmwXw+U=;
        b=BoaG6eU1AeeJl91r1ccqIFLj9dFiN4TvCcIOcLrPBtiUSzwlkHB2kVulvs6RTS+JHe
         UE1/7eR9fIsNRr3jZ2HM7BoOdWswnCkbaIXTAAbf04Q77CQ3axtgtfS9tgSXKzVc9AJq
         e/AfukHZC+50FvidWqyqBDd8rob9fJBmvS35UP+fUf/HZWM95hpnKA60AMIbAaVnOfH0
         ctnt+LciI0vdcD0tKqMFfLRG+35Vc1KbtEZuD79EY/bPhT6bX/oSUNPH+g6VYVhA0CvT
         ZfmSHXzj0/vhGbyP2vOj+GHPyUaiLWAXXyomD+h9O6/x1W7D1I0kF1DLbBVP0wFrQNkJ
         sueA==
X-Forwarded-Encrypted: i=1; AL+hErFHkt4j5FUwVqSqUUeJuw2C0ptBUlbnjxecSRhN9IbdRpUURjnucVCZB2Pq5G0Gzf85A60Ox83b6R7OuxqD@lists.linux.dev
X-Gm-Message-State: APuU4Z9QDN1cERjS4PNYHlcuzPROjCRTWlf5/kAT3tNhNfpVyYc+Ibkj
	ytA7WdoVvSPRicGxtN1/m1uJHFmYpAW7C09K3fItxoBrgGOdnMPFBQ4TKZvGxvT9HoOmOg==
X-Gm-Gg: AZFdTZcJDcsV3LWOtTgGBF02W/kqNZgh4dvGzqFLIDL2/S6zDMYxX/kKNXPdODLrxvJ
	7ytJ5ymBzF3mipaFlXzNEZoXltCYG3F17axajPZ1cayQ09Eu7SrIpfJYNZI3I60eKs9vrtdkPCS
	dYg17Q1Tlb1cJ5EU3R/XTnla9pnF2lzsCOMGcFF25vmRveCKm+Ve+F18WHwtTeySXYy5O/8mTkx
	Px5V5scVdyMoqZMv3JIcG32rMjB8zFKVWzjZ0LdE/KbYyDuFxVt2/0ZlgaxhE7xXyJFr3t8Sjnm
	s5opOBHcR7b0leOXMRLybp4kc8ufHzOPx17EWUA9SWyBeNIxum/hKkpLv9tiXnClG50vdtb6Bs/
	PfTlU5LntrJsi+Q0D9ORR022TkK4vrLdQ09jsc7pedJUjJ4QcaIQAgJqa6Py0ukgOvipt6ihXDl
	U+8+OtgIJkxZl2f5sgdEwsyKODfCLkLpczoB/IwqAisTXi9YaenCLmvVR7gnrh6oBiCQTo/FX+I
	y0urIG6aR1Vi6hIEU0ydYXU/ta1RtOi2OqpiOEkHwvolgRZMKP5AegglU4b6HTZSUk+abf0kqAd
	J/AITiHgOdhk+fYZvWDwTQ7/uu8V1g2BavzYNl+4EjefTa0NQ4FaNw8O4myOIK6J5GMOIL8XIRW
	+6jsm2uw0B2mt9R5nX9+ovfgjQ+rchnBYbB+nsAMuNtrt8DjPKyI3o8z2Yx7M5KRclGssmJgN/5
	PStueHzwT01Apn
X-Received: by 2002:a05:600c:638f:b0:4bb:7581:2bb9 with SMTP id 5b1f17b1804b1-4bb8892692dmr357274335e9.22.1795672871136;
        Wed, 25 Nov 2026 22:01:11 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm44045084f8f.55.2026.11.25.22.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:01:10 -0800 (PST)
Date: Thu, 26 Nov 2026 09:01:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Ian Bridges <icb@fastmail.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [linkinjeon-smb:ksmbd-for-next 48/48] fs/smb/server/smbacl.c:793
 parse_sec_desc() warn: missing error code? 'rc'
Message-ID: <20261126042013.QSoDDLPw-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git ksmbd-for-next
head:   f9208b7a49196e36c0434637ab83e001f5800a1d
commit: f9208b7a49196e36c0434637ab83e001f5800a1d [48/48] ksmbd: use the security descriptor codec in callers
config: sparc-randconfig-2200-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126042013.QSoDDLPw-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261126042013.QSoDDLPw-lkp@intel.com/

smatch warnings:
fs/smb/server/smbacl.c:793 parse_sec_desc() warn: missing error code? 'rc'

vim +/rc +793 fs/smb/server/smbacl.c

1923c1065fe94c fs/smb/server/smbacl.c Christian Brauner         2026-09-01  768  int parse_sec_desc(const struct mnt_idmap *idmap, struct smb_ntsd *pntsd,
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  769  		   int acl_len, struct smb_fattr *fattr, struct ksmbd_sd **psd)
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  770  {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  771  	int rc = 0;
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  772  	const struct smb_sid *owner_sid_ptr = NULL, *group_sid_ptr = NULL;
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  773  	struct ksmbd_sd *sd __free(kvfree) = NULL;
548e9ad317393b fs/cifsd/smbacl.c      Namjae Jeon               2021-03-21  774  	int pntsd_type;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  775  
64b39f4a2fd293 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-30  776  	if (!pntsd)
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  777  		return -EIO;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  778  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  779  	if (acl_len < (int)sizeof(struct smb_ntsd))
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee              2021-09-24  780  		return -EINVAL;
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee              2021-09-24  781  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  782  	/* Refuse an SD from a client if the decoder left a part out */
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  783  	rc = ksmbd_sd_decode((u8 *)pntsd, acl_len, &sd);
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  784  	if (rc == -EBADMSG || (!rc && sd->part_dropped))
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  785  		rc = -EINVAL;
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  786  	if (rc)
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  787  		return rc;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  788  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  789  	pntsd_type = sd->control;
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  790  	if (sd->dacl == KSMBD_ACL_ABSENT) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  791  		ksmbd_debug(SMB, "DACL_PRESENT in DACL type is not set\n");
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  792  		*psd = no_free_ptr(sd);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16 @793  		return rc;

This works but "return 0;" would be more readable.

e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  794  	}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  795  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  796  	/* The stored SD keeps only the Control bits set below and no SACL */
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  797  	sd->control = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

