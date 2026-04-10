Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB5E33FE26;
	Fri, 10 Apr 2026 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775823291; cv=none; b=ClI9CTcO6IBawNO1lcVuZ4fGm75iEv4PsyFQ4nZ5QM68DTtjrABVkdBqJY3lsKdd/bgVAwN9kB42HIIPKV+ciCnfM+PkEfC+PHh9FUoWIWvOl2u3S9OionLOYcaU6NHz9GglYfWO3bU/5pT44Tf5su5bVreJhsVSBK/wXKwbeAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775823291; c=relaxed/simple;
	bh=2Mk6bChQxnG7WOCfTfMqsRWvkq3UrOV7UbRvBlaMed0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aMMxju7o/h3yAbARewBYmcotb2RQY9Ghe3VlhiDd8wuCKgEcM2y57jPC0Z2IY3er1LP5Hm1yedlwrfS2wJOzariPV3bVwb01Dy1rAhqYo4G3HosJG11H2QpY6bFk0nlT6tzNq8zxRalVnwgJT7T1A+IiE86Mvd+vYedZVsfLzCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=D0xYuxGB; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="D0xYuxGB"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63ACEgcH62986449, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775823282; bh=/7y938S5rJn97OMYLP6QQqX7WO3SiOuhfTnrLDpaVic=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=D0xYuxGBvfOCQiQ5CQkAjrNOv4hjhgd5U7Vx8KPAP2sNIjWz1qy2A/b4h72iI43Oy
	 mu102WrnIZEb6h4u+20YZQK8DKevuI20wf6EepgHf5aT3OXGcQoaRlQYytqocFqBjW
	 ORN0HbeaZoBp9RuAeWPdkwnyLuv6Rd8i8xhFL4LHHZYLVJsLhTQI3CdohGfleAh2s1
	 +WYJldx5urW017DvpX4HKAqvUulPEzEPp3dY7UxaG2deaYKSUynVQmmz+WODxXgFi6
	 MCuWqXEReskbFq2CDoKyjRfGpovNNbonii8UKzmSk3Us+FJz2zkmLm00RbLi5riexf
	 DWYeVet6ylOvQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63ACEgcH62986449
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Apr 2026 20:14:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 10 Apr 2026 20:14:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Fri, 10 Apr 2026 20:14:42 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
        kernel test robot
	<lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(struct rtw8814a_efuse) == 512"
Thread-Topic: include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(struct rtw8814a_efuse) == 512"
Thread-Index: AQHcyMv6u/YWKjXW3EGUlXMtosQaj7XXrWIAgACG/OI=
Date: Fri, 10 Apr 2026 12:14:42 +0000
Message-ID: <1e02bd10a68747f4a342caedde76ef04@realtek.com>
References: <202604101721.fsv5XmCX-lkp@intel.com>,<2fb2a553-3e67-497e-b964-7fa5f940e8a1@gmail.com>
In-Reply-To: <2fb2a553-3e67-497e-b964-7fa5f940e8a1@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


Bitterblue Smith <rtl8821cerfe2@gmail.com> wrote:

> On 10/04/2026 12:25, kernel test robot wrote:
> > tree:=A0=A0  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git master
> > head:=A0=A0 9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
> > commit: deb3ddeb18652118956fb581a39ac299e1ee5623 wifi: rtw88: Enable th=
e new RTL8814AE/RTL8814AU drivers
> > date:=A0=A0 1 year, 1 month ago
> > config: arm-randconfig-001-20260410 (https://download.01.org/0day-ci/ar=
chive/20260410/202604101721.fsv5XmCX-lkp@intel.com/config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260410/202604101721.fsv5XmCX-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Fixes: deb3ddeb1865 ("wifi: rtw88: Enable the new RTL8814AE/RTL8814AU=
 drivers")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:  https://lore.kernel.org/oe-kbuild-all/202604101721.fsv5XmCX-=
lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >=A0=A0=A0 In file included from include/linux/bitfield.h:10,
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 from includ=
e/linux/fortify-string.h:5,
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 from includ=
e/linux/string.h:389,
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 from includ=
e/linux/uuid.h:11,
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 from includ=
e/linux/mod_devicetable.h:14,
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 from includ=
e/linux/usb.h:5,
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 from driver=
s/net/wireless/realtek/rtw88/rtw8814a.c:5:
> >>> include/linux/build_bug.h:78:41: error: static assertion failed: "siz=
eof(struct rtw8814a_efuse) =3D=3D 512"
>=20
> struct rtw_2g_txpwr_idx is missing __packed. Could that be the reason
> for the error? I don't see what else could be causing it.
>=20

I also found that flaw, but it isn't cause. I download cross compiler
to build arm on my x86, and address the cause is:

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.h b/drivers/net/wi=
reless/realtek/rtw88/rtw8814a.h
index c57c7c8f915e..7f2260117487 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8814a.h
+++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.h
@@ -51,10 +51,15 @@ struct rtw8814a_efuse {
        union {
                struct rtw8814au_efuse u;
                struct rtw8814ae_efuse e;
-       };
+       } __packed;
        u8 res5[0x122];                 /* 0xde */
 } __packed;

I will send a patch soon.

Ping-Ke

