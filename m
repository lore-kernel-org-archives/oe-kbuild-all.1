Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDEB260565
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 05:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777527248; cv=none; b=DGNKdt85SkoUZe95hWG30SQOZMwOlQYJOyUXHiYIUDUNfo9EA6eSCe4oHpyd5ZDeu83b3O+IrirznuYQcaQWOGrJGZ6aley9+t/I8/IHsnbItYf81yBMJ4XasYy7Gc3GpDOHoz+chp1L4gKzeHxUAHRROjx0G45P5IjhNsB0uFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777527248; c=relaxed/simple;
	bh=OYObgb/EpZq1ejnJFsVcP1JqCuEaRAq3H4pxQ/7My0E=;
	h=Mime-Version:Subject:From:To:CC:In-Reply-To:Message-ID:Date:
	 Content-Type:References; b=eFG1BHmIcXZOAUY+Co4UaYl72qa/esTqY5F9bNc0ckrGDBqlOSo+LWs/5B3c5KFsjISMVa2xqFULWSMYNg4MxfKejdHKP4JO097qovo+c8inCjFZ91QB09fKvfN6EiFUF1mjXKliobV4Oi/HiV10Ee1l2mm1/2u4+1Ea/OYQkhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Sox1D+Le; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Sox1D+Le"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260430053403epoutp040546bf0ab77b7d41ba3208a34c0f7b4f~rC5waioY52376723767epoutp04C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 05:34:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260430053403epoutp040546bf0ab77b7d41ba3208a34c0f7b4f~rC5waioY52376723767epoutp04C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1777527243;
	bh=OYObgb/EpZq1ejnJFsVcP1JqCuEaRAq3H4pxQ/7My0E=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=Sox1D+LerfizLJb+QFBow2ZPOBsqijCvbtVpOd5RiK2LGgkuGQAnERZObia9WXMtD
	 zrAl8/MObOuYM5rSIpViR+oP75rbf27pXkGTyhwOA+owG96LMrnYig//F/nA+7LQBq
	 O9qrpuxaGgJLleVUMziNCgC82ZQvuWJy0ea5PpfE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20260430053402epcas2p2b82019892e27cf2758a26bb998a8d8a4~rC5v1qd3v2354223542epcas2p25;
	Thu, 30 Apr 2026 05:34:02 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.204]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4g5jXB1G3sz6B9mB; Thu, 30 Apr
	2026 05:34:02 +0000 (GMT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: RE: [PATCH v6] nvme: Skip trace complete_rq on host path error
Reply-To: hmi.jeon@samsung.com
Sender: =?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
From: =?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
To: kernel test robot <lkp@intel.com>, "kbusch@kernel.org"
	<kbusch@kernel.org>, "hch@lst.de" <hch@lst.de>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"axboe@kernel.dk" <axboe@kernel.dk>, "sagi@grimberg.me" <sagi@grimberg.me>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?UTF-8?B?7J207J2A7IiY?= <euns212.lee@samsung.com>, =?UTF-8?B?7Lm47LCs?=
	<joshi.k@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <202604300750.YpUGtmek-lkp@intel.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260430053401epcms2p88c3cac0c3b817015d718cc0f4914532b@epcms2p8>
Date: Thu, 30 Apr 2026 14:34:01 +0900
X-CMS-MailID: 20260430053401epcms2p88c3cac0c3b817015d718cc0f4914532b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260430051839epcas2p20fce5951dc4a04138033e5943f1acdbf
References: <202604300750.YpUGtmek-lkp@intel.com>
	<20260416010713epcms2p78575bd400f93f6edb7fe3f3ead5bf930@epcms2p7>
	<CGME20260430051839epcas2p20fce5951dc4a04138033e5943f1acdbf@epcms2p8>

On Thu, Apr 17, 2026 at 01:00 UTC, =EC=A0=84=EB=AF=BC=EC=8B=9D=20wrote:=0D=
=0A>=20On=20Thu,=20Apr=2016,=202026=20at=2022:00=20UTC,=20Keith=20Busch=20w=
rote:=0D=0A>=20>=20You're=20missing=20the=20=22static=22=20declaration,=20w=
hich=20was=20present=20in=20the=0D=0A>=20>=20original=20suggestion:=0D=0A>=
=20>=0D=0A>=20>=20https://lore.kernel.org/linux-nvme/acVCnozG1WKPkq1L=40kbu=
sch-mbp/=0D=0A>=20>=0D=0A>=20>=20Should=20I=20just=20apply=20my=20local=20c=
opy?=20I=20think=20it's=20an=20original=20patch=20from=0D=0A>=20>=20me=20at=
=20this=20point.=0D=0A>=0D=0A>=20Please=20go=20ahead=20and=20apply=20your=
=20local=20copy.=0D=0A>=20I=20appreciate=20your=20help=20in=20finalizing=20=
the=20patch.=0D=0A=0D=0AHi=20Keith,=0D=0A=0D=0AAre=20you=20planning=20to=20=
apply=20your=20local=20fix=20directly?=0D=0A=0D=0AThanks,=0D=0AMinsik=20Jeon
