Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84031FAC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 10:50:48 +0000 (UTC)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3849au0o022803;
	Mon, 4 Sep 2023 09:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=jNAb+ZfjEgkY77CLYFcrF49vtuCIfCOrymPHDfJEstQ=;
 b=VE/MProxdLKJCZZvNqY6fxaAuB3WFIt3KURhG3B+H1I+ZJkuY0z3ksz/PKmxpX+1wpGG
 led2ZRv+ZndhsIMlVVeD0f6IIqzklqRmRx0TF9dGDbNG1Q6w44SbfKFvghDfq+vPv+RO
 iSSXhBEH3vhJhyFDM6y3G0qncV14Vkah8eifV9EyiEw0qc7MH5Cui7SeJePU3qqaBbTA
 8HWVCMdXcRkxH/KThIV1uq1iIZO5QCZuZW6sxzZVc7BUynNXEVwcSfSHttDKLyEU9kLC
 Y0BJHuS+z4lnZFxUpPhXDilQFjwNIUA+zLh2tTeUyhkb8TLrZ/scOGK63XT43fPTku3p SA== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sw84eyjtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Sep 2023 09:45:40 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3849cGbM021412;
	Mon, 4 Sep 2023 09:45:39 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svfry1q7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Sep 2023 09:45:39 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3849jbfE46400108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Sep 2023 09:45:37 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E84220043;
	Mon,  4 Sep 2023 09:45:37 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 155D62004D;
	Mon,  4 Sep 2023 09:45:37 +0000 (GMT)
Received: from [9.179.17.91] (unknown [9.179.17.91])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Sep 2023 09:45:37 +0000 (GMT)
Message-ID: <26e72ec44f952a36756f6a9591cd432e199f4438.camel@linux.ibm.com>
Subject: Re: [niks:has_ioport_v6_usb 20/20] include/asm-generic/io.h:625:15:
 error: call to '_outl' declared with attribute error: outl() requires
 CONFIG_HAS_IOPORT
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Carstens <hca@linux.ibm.com>
Date: Mon, 04 Sep 2023 11:45:36 +0200
In-Reply-To: <202309021509.H6yovgPT-lkp@intel.com>
References: <202309021509.H6yovgPT-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QgLWEaAhBTTSsFrVJ_URDdxZiK_ilCJ2
X-Proofpoint-GUID: QgLWEaAhBTTSsFrVJ_URDdxZiK_ilCJ2
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-04_07,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 clxscore=1011 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309040086

On Sat, 2023-09-02 at 15:08 +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git ha=
s_ioport_v6_usb
> head:   cf97bf195665223cec989e41efee82344a2f0eea
> commit: cf97bf195665223cec989e41efee82344a2f0eea [20/20] asm-generic/io.h=
: Remove I/O port accessors for HAS_IOPORT=3Dn
> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/2023090=
2/202309021509.H6yovgPT-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230902/202309021509.H6yovgPT-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202309021509.H6yovgPT-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
---8<---
>                   ^~~~~~~~~~~~~
>    lib/iomap.c: In function 'ioread8':
>    include/asm-generic/io.h:541:14: error: call to '_inb' declared with a=
ttribute error: inb()) requires CONFIG_HAS_IOPORT
>      541 | #define _inb _inb
>    lib/iomap.c:58:17: note: in definition of macro 'IO_COND'
>       58 |                 is_pio;                                       =
  \
>          |                 ^~~~~~
>    include/asm-generic/io.h:642:13: note: in expansion of macro '_inb'
>      642 | #define inb _inb
>          |             ^~~~
>    lib/iomap.c:81:30: note: in expansion of macro 'inb'
>       81 |         IO_COND(addr, return inb(port), return readb(addr));
>          |                              ^~~
>    lib/iomap.c: In function 'ioread16':
>=20
>=20

@Arnd no idea why I've not seen this issue before but I think we need
IO_COND() not to compile the is_pio branch if !HAS_IOPORT.

Something like:

lib/iomap.c:
...
/*
 * Ugly macros are a way of life.
 */
#ifdef CONFIG_HAS_IOPORT
#define IO_COND(addr, is_pio, is_mmio) do {			\
	unsigned long port =3D (unsigned long __force)addr;	\
	if (port >=3D PIO_RESERVED) {				\
		is_mmio;					\
	} else if (port > PIO_OFFSET)
{				\
		port &=3D PIO_MASK;				\
		is_pio;=09=09=09=09=09
	\
	} else							\
		bad_io_access(port, #is_pio );			\
} while (0)
#else
#define IO_COND(addr, is_pio, is_mmio) do {			\
	unsigned long port =3D (unsigned long __force)addr;	\
	if (port >=3D PIO_RESERVED)				\
		is_mmio;					\
	else							\
		bad_io_access(port, #is_pio );			\
} while (0)
#endif

And yes I'm back and have also started in splitting up the usb
HAS_IOPORT patch as well as adding a lot of watchdog drivers
(https://lore.kernel.org/all/20230728195022.1198555-1-robh@kernel.org/)

Thanks,
Niklas
