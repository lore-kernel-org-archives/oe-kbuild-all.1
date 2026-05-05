Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ECE214813
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 04:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777954604; cv=none; b=dDV9mwqt/W25hRm3nX7nSplDdhMQSPWKZy4ZbxrCWynd6jk78xdpWb0GaM0c96D/OZGHLBXb0DzEpV8YunfzW30nuooeo7u7GNCu4RrKTlJoCzlrcIzDzJCLAYOCg8Zm7aR2IS2eSnpb6imlBVQ4A4EjCaywpjvQV+t7lSXqkfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777954604; c=relaxed/simple;
	bh=zVjf01KN+FgvhNClAUbWGuY1uCHRhIjrcTqN5h+xYN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i+NE9gqUSrKiFvafXNx8Ds2G5xqubsSsAFeKLUA4c32CrZ3VARr6sxUmRghwh8xBIBldI08aBUhm61iL6ntb1cP4gFgr2nJmNuykBft18gaDHYuSCt0PXuvqgT+ceXNdnyXI+pRX6YJf0EJSDLYsoOG7SowcJxjI54B0cNF1cqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGaCqEE9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGaCqEE9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777954602; x=1809490602;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zVjf01KN+FgvhNClAUbWGuY1uCHRhIjrcTqN5h+xYN0=;
  b=NGaCqEE9s2XZwMnZLNZ4HHB1xSnpwjaz7xaFXcaQbmuZdrD2mTLBBpI0
   irp97twcL4g+V4LZ1/+1jDetYhemCDEN4kM1mzcBszozWOneO6AEIzTDS
   k48r4Zs9onKOlklwXirDx8If48ujwfIpP636mLTvJ6QrAHzDX54Uz5FVN
   zbjx/of/azkEf5l0lkzmpMzDV7ag0M7iAab+wgHIhp5ZphEj6StfR7uk6
   gqgo8WJ30+QAb8OW/oULMU9odcONG1/eTSDoFZbMso68Wp9eqhWdYoPgj
   R2/wDggD8+/Ji1MNzrQl86cfP/dVD4O8Wz3LnKwqG2MB12JOq9oB60SZB
   A==;
X-CSE-ConnectionGUID: 15M6z05VQe+3mrvbWUJeEw==
X-CSE-MsgGUID: YGklkkNUSuS5so7dswEXfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89123369"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="89123369"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 21:16:38 -0700
X-CSE-ConnectionGUID: c81vAmC/TweDg5Q4saStZA==
X-CSE-MsgGUID: jU1xlfBARbeQTQ/l8hiJhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="235572033"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 May 2026 21:16:35 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK7Cu-000000004FL-1MUR;
	Tue, 05 May 2026 04:16:29 +0000
Date: Tue, 05 May 2026 12:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-iscsi 1/1]
 drivers/target/iscsi/iscsi_target_auth.c:594:1: warning: the frame size of
 1304 bytes is larger than 1280 bytes
Message-ID: <202605051206.oaHE3r6x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git =
wip-iscsi
head:   d75081a34e037b17f0f59228963a1cbd46afd4bd
commit: d75081a34e037b17f0f59228963a1cbd46afd4bd [1/1] scsi: target: iscsi:=
 Use crypto library API
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260505/=
202605051206.oaHE3r6x-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260505/202605051206.oaHE3r6x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051206.oaHE3r6x-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/target/iscsi/iscsi_target_auth.c: In function 'chap_server_compu=
te_hash':
>> drivers/target/iscsi/iscsi_target_auth.c:594:1: warning: the frame size =
of 1304 bytes is larger than 1280 bytes [-Wframe-larger-than=3D]
     594 | }
         | ^


vim +594 drivers/target/iscsi/iscsi_target_auth.c

1e5733883421495 Dmitry Bogdanov    2022-07-18  310 =20
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  311  static int chap_server_=
compute_hash(
be36d683fc29e74 Max Gurtovoy       2022-04-28  312  	struct iscsit_conn *co=
nn,
e48354ce078c079 Nicholas Bellinger 2011-07-23  313  	struct iscsi_node_auth=
 *auth,
e48354ce078c079 Nicholas Bellinger 2011-07-23  314  	char *nr_in_ptr,
e48354ce078c079 Nicholas Bellinger 2011-07-23  315  	char *nr_out_ptr,
e48354ce078c079 Nicholas Bellinger 2011-07-23  316  	unsigned int *nr_out_l=
en)
e48354ce078c079 Nicholas Bellinger 2011-07-23  317  {
bc704fb58f507de Nicholas Bellinger 2011-11-28  318  	unsigned long id;
7ac9ad11b2a5cf7 Andy Grover        2013-03-04  319  	unsigned char id_as_uc=
har;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  320  	unsigned char type;
f9fab3d9860050e Maurizio Lombardi  2019-10-17  321  	unsigned char identifi=
er[10], *initiatorchg =3D NULL;
f9fab3d9860050e Maurizio Lombardi  2019-10-17  322  	unsigned char *initiat=
orchg_binhex =3D NULL;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  323  	unsigned char *digest =
=3D NULL;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  324  	unsigned char *respons=
e =3D NULL;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  325  	unsigned char *client_=
digest =3D NULL;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  326  	unsigned char *server_=
digest =3D NULL;
e48354ce078c079 Nicholas Bellinger 2011-07-23  327  	unsigned char chap_n[M=
AX_CHAP_N_SIZE], chap_r[MAX_RESPONSE_LENGTH];
d75081a34e037b1 Eric Biggers       2026-04-21  328  	struct chap_digest_ctx=
 digest_ctx;
86784c6bdeeef78 Eric Seppanen      2013-11-20  329  	size_t compare_len;
8359cf43b9dccdd J=C3=B6rn Engel         2011-11-24  330  	struct iscsi_chap=
 *chap =3D conn->auth_protocol;
f9fab3d9860050e Maurizio Lombardi  2019-10-17  331  	int auth_ret =3D -1, r=
et, initiatorchg_len;
e48354ce078c079 Nicholas Bellinger 2011-07-23  332 =20
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  333  	digest =3D kzalloc(cha=
p->digest_size, GFP_KERNEL);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  334  	if (!digest) {
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  335  		pr_err("Unable to all=
ocate the digest buffer\n");
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  336  		goto out;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  337  	}
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  338 =20
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  339  	response =3D kzalloc(c=
hap->digest_size * 2 + 2, GFP_KERNEL);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  340  	if (!response) {
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  341  		pr_err("Unable to all=
ocate the response buffer\n");
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  342  		goto out;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  343  	}
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  344 =20
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  345  	client_digest =3D kzal=
loc(chap->digest_size, GFP_KERNEL);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  346  	if (!client_digest) {
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  347  		pr_err("Unable to all=
ocate the client_digest buffer\n");
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  348  		goto out;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  349  	}
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  350 =20
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  351  	server_digest =3D kzal=
loc(chap->digest_size, GFP_KERNEL);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  352  	if (!server_digest) {
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  353  		pr_err("Unable to all=
ocate the server_digest buffer\n");
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  354  		goto out;
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  355  	}
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  356 =20
e48354ce078c079 Nicholas Bellinger 2011-07-23  357  	memset(identifier, 0, =
10);
e48354ce078c079 Nicholas Bellinger 2011-07-23  358  	memset(chap_n, 0, MAX_=
CHAP_N_SIZE);
e48354ce078c079 Nicholas Bellinger 2011-07-23  359  	memset(chap_r, 0, MAX_=
RESPONSE_LENGTH);
e48354ce078c079 Nicholas Bellinger 2011-07-23  360 =20
f9fab3d9860050e Maurizio Lombardi  2019-10-17  361  	initiatorchg =3D kzall=
oc(CHAP_CHALLENGE_STR_LEN, GFP_KERNEL);
f9fab3d9860050e Maurizio Lombardi  2019-10-17  362  	if (!initiatorchg) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  363  		pr_err("Unable to all=
ocate challenge buffer\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  364  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  365  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  366 =20
f9fab3d9860050e Maurizio Lombardi  2019-10-17  367  	initiatorchg_binhex =
=3D kzalloc(CHAP_CHALLENGE_STR_LEN, GFP_KERNEL);
f9fab3d9860050e Maurizio Lombardi  2019-10-17  368  	if (!initiatorchg_binh=
ex) {
f9fab3d9860050e Maurizio Lombardi  2019-10-17  369  		pr_err("Unable to all=
ocate initiatorchg_binhex buffer\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  370  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  371  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  372  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  373  	 * Extract CHAP_N.
e48354ce078c079 Nicholas Bellinger 2011-07-23  374  	 */
e48354ce078c079 Nicholas Bellinger 2011-07-23  375  	if (extract_param(nr_i=
n_ptr, "CHAP_N", MAX_CHAP_N_SIZE, chap_n,
e48354ce078c079 Nicholas Bellinger 2011-07-23  376  				&type) < 0) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  377  		pr_err("Could not fin=
d CHAP_N.\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  378  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  379  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  380  	if (type =3D=3D HEX) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  381  		pr_err("Could not fin=
d CHAP_N.\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  382  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  383  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  384 =20
86784c6bdeeef78 Eric Seppanen      2013-11-20  385  	/* Include the termina=
ting NULL in the compare */
86784c6bdeeef78 Eric Seppanen      2013-11-20  386  	compare_len =3D strlen=
(auth->userid) + 1;
86784c6bdeeef78 Eric Seppanen      2013-11-20  387  	if (strncmp(chap_n, au=
th->userid, compare_len) !=3D 0) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  388  		pr_err("CHAP_N values=
 do not match!\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  389  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  390  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  391  	pr_debug("[server] Got=
 CHAP_N=3D%s\n", chap_n);
e48354ce078c079 Nicholas Bellinger 2011-07-23  392  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  393  	 * Extract CHAP_R.
e48354ce078c079 Nicholas Bellinger 2011-07-23  394  	 */
e48354ce078c079 Nicholas Bellinger 2011-07-23  395  	if (extract_param(nr_i=
n_ptr, "CHAP_R", MAX_RESPONSE_LENGTH, chap_r,
e48354ce078c079 Nicholas Bellinger 2011-07-23  396  				&type) < 0) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  397  		pr_err("Could not fin=
d CHAP_R.\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  398  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  399  	}
1e5733883421495 Dmitry Bogdanov    2022-07-18  400 =20
1e5733883421495 Dmitry Bogdanov    2022-07-18  401  	switch (type) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  402  	case HEX:
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  403  		if (strlen(chap_r) !=
=3D chap->digest_size * 2) {
1816494330a83f2 Vincent Pelletier  2018-09-09  404  			pr_err("Malformed CH=
AP_R\n");
1816494330a83f2 Vincent Pelletier  2018-09-09  405  			goto out;
1816494330a83f2 Vincent Pelletier  2018-09-09  406  		}
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  407  		if (hex2bin(client_di=
gest, chap_r, chap->digest_size) < 0) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  408  			pr_err("Malformed CH=
AP_R: invalid HEX\n");
1e5733883421495 Dmitry Bogdanov    2022-07-18  409  			goto out;
1e5733883421495 Dmitry Bogdanov    2022-07-18  410  		}
1e5733883421495 Dmitry Bogdanov    2022-07-18  411  		break;
1e5733883421495 Dmitry Bogdanov    2022-07-18  412  	case BASE64:
1e5733883421495 Dmitry Bogdanov    2022-07-18  413  		if (chap_base64_decod=
e(client_digest, chap_r, strlen(chap_r)) !=3D
1e5733883421495 Dmitry Bogdanov    2022-07-18  414  		    chap->digest_size=
) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  415  			pr_err("Malformed CH=
AP_R: invalid BASE64\n");
1e5733883421495 Dmitry Bogdanov    2022-07-18  416  			goto out;
1e5733883421495 Dmitry Bogdanov    2022-07-18  417  		}
1e5733883421495 Dmitry Bogdanov    2022-07-18  418  		break;
1e5733883421495 Dmitry Bogdanov    2022-07-18  419  	default:
1e5733883421495 Dmitry Bogdanov    2022-07-18  420  		pr_err("Could not fin=
d CHAP_R\n");
1816494330a83f2 Vincent Pelletier  2018-09-09  421  		goto out;
1816494330a83f2 Vincent Pelletier  2018-09-09  422  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  423 =20
e48354ce078c079 Nicholas Bellinger 2011-07-23  424  	pr_debug("[server] Got=
 CHAP_R=3D%s\n", chap_r);
e48354ce078c079 Nicholas Bellinger 2011-07-23  425 =20
d75081a34e037b1 Eric Biggers       2026-04-21  426  	ret =3D chap_digest_in=
it(&digest_ctx, chap->digest_type);
e48354ce078c079 Nicholas Bellinger 2011-07-23  427  	if (ret < 0) {
d75081a34e037b1 Eric Biggers       2026-04-21  428  		pr_err("chap_digest_i=
nit() failed\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  429  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  430  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  431 =20
d75081a34e037b1 Eric Biggers       2026-04-21  432  	chap_digest_update(&di=
gest_ctx, &chap->id, 1);
d75081a34e037b1 Eric Biggers       2026-04-21  433  	chap_digest_update(&di=
gest_ctx, &auth->password,
69110e3cedbb8aa Herbert Xu         2016-01-24  434  			   strlen(auth->pass=
word));
d75081a34e037b1 Eric Biggers       2026-04-21  435  	chap_digest_update(&di=
gest_ctx, chap->challenge, chap->challenge_len);
d75081a34e037b1 Eric Biggers       2026-04-21  436  	chap_digest_final(&dig=
est_ctx, server_digest);
e48354ce078c079 Nicholas Bellinger 2011-07-23  437 =20
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  438  	bin2hex(response, serv=
er_digest, chap->digest_size);
19f5f88ed779180 Maurizio Lombardi  2019-10-17  439  	pr_debug("[server] %s =
Server Digest: %s\n",
19f5f88ed779180 Maurizio Lombardi  2019-10-17  440  		chap->digest_name, re=
sponse);
e48354ce078c079 Nicholas Bellinger 2011-07-23  441 =20
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  442  	if (memcmp(server_dige=
st, client_digest, chap->digest_size) !=3D 0) {
19f5f88ed779180 Maurizio Lombardi  2019-10-17  443  		pr_debug("[server] %s=
 Digests do not match!\n\n",
19f5f88ed779180 Maurizio Lombardi  2019-10-17  444  			chap->digest_name);
e48354ce078c079 Nicholas Bellinger 2011-07-23  445  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  446  	} else
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  447  		pr_debug("[server] %s=
 Digests match, CHAP connection"
19f5f88ed779180 Maurizio Lombardi  2019-10-17  448  				" successful.\n\n",=
 chap->digest_name);
e48354ce078c079 Nicholas Bellinger 2011-07-23  449  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  450  	 * One way authenticat=
ion has succeeded, return now if mutual
e48354ce078c079 Nicholas Bellinger 2011-07-23  451  	 * authentication is n=
ot enabled.
e48354ce078c079 Nicholas Bellinger 2011-07-23  452  	 */
e48354ce078c079 Nicholas Bellinger 2011-07-23  453  	if (!auth->authenticat=
e_target) {
69110e3cedbb8aa Herbert Xu         2016-01-24  454  		auth_ret =3D 0;
69110e3cedbb8aa Herbert Xu         2016-01-24  455  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  456  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  457  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  458  	 * Get CHAP_I.
e48354ce078c079 Nicholas Bellinger 2011-07-23  459  	 */
292cef5e6262e79 Dmitry Bogdanov    2022-07-18  460  	ret =3D extract_param(=
nr_in_ptr, "CHAP_I", 10, identifier, &type);
292cef5e6262e79 Dmitry Bogdanov    2022-07-18  461  	if (ret =3D=3D -ENOENT=
) {
292cef5e6262e79 Dmitry Bogdanov    2022-07-18  462  		pr_debug("Could not f=
ind CHAP_I. Initiator uses One way authentication.\n");
292cef5e6262e79 Dmitry Bogdanov    2022-07-18  463  		auth_ret =3D 0;
292cef5e6262e79 Dmitry Bogdanov    2022-07-18  464  		goto out;
292cef5e6262e79 Dmitry Bogdanov    2022-07-18  465  	}
292cef5e6262e79 Dmitry Bogdanov    2022-07-18  466  	if (ret < 0) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  467  		pr_err("Could not fin=
d CHAP_I.\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  468  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  469  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  470 =20
e48354ce078c079 Nicholas Bellinger 2011-07-23  471  	if (type =3D=3D HEX)
b06eef6eab8e4a2 Nicholas Bellinger 2014-06-13  472  		ret =3D kstrtoul(&ide=
ntifier[2], 0, &id);
e48354ce078c079 Nicholas Bellinger 2011-07-23  473  	else
b06eef6eab8e4a2 Nicholas Bellinger 2014-06-13  474  		ret =3D kstrtoul(iden=
tifier, 0, &id);
b06eef6eab8e4a2 Nicholas Bellinger 2014-06-13  475 =20
b06eef6eab8e4a2 Nicholas Bellinger 2014-06-13  476  	if (ret < 0) {
b06eef6eab8e4a2 Nicholas Bellinger 2014-06-13  477  		pr_err("kstrtoul() fa=
iled for CHAP identifier: %d\n", ret);
b06eef6eab8e4a2 Nicholas Bellinger 2014-06-13  478  		goto out;
b06eef6eab8e4a2 Nicholas Bellinger 2014-06-13  479  	}
bc704fb58f507de Nicholas Bellinger 2011-11-28  480  	if (id > 255) {
bc704fb58f507de Nicholas Bellinger 2011-11-28  481  		pr_err("chap identifi=
er: %lu greater than 255\n", id);
bc704fb58f507de Nicholas Bellinger 2011-11-28  482  		goto out;
bc704fb58f507de Nicholas Bellinger 2011-11-28  483  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  484  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  485  	 * RFC 1994 says Ident=
ifier is no more than octet (8 bits).
e48354ce078c079 Nicholas Bellinger 2011-07-23  486  	 */
bc704fb58f507de Nicholas Bellinger 2011-11-28  487  	pr_debug("[server] Got=
 CHAP_I=3D%lu\n", id);
e48354ce078c079 Nicholas Bellinger 2011-07-23  488  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  489  	 * Get CHAP_C.
e48354ce078c079 Nicholas Bellinger 2011-07-23  490  	 */
e48354ce078c079 Nicholas Bellinger 2011-07-23  491  	if (extract_param(nr_i=
n_ptr, "CHAP_C", CHAP_CHALLENGE_STR_LEN,
f9fab3d9860050e Maurizio Lombardi  2019-10-17  492  			initiatorchg, &type)=
 < 0) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  493  		pr_err("Could not fin=
d CHAP_C.\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  494  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  495  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  496 =20
1e5733883421495 Dmitry Bogdanov    2022-07-18  497  	switch (type) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  498  	case HEX:
1e5733883421495 Dmitry Bogdanov    2022-07-18  499  		initiatorchg_len =3D =
DIV_ROUND_UP(strlen(initiatorchg), 2);
1e5733883421495 Dmitry Bogdanov    2022-07-18  500  		if (!initiatorchg_len=
) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  501  			pr_err("Unable to co=
nvert incoming challenge\n");
1e5733883421495 Dmitry Bogdanov    2022-07-18  502  			goto out;
1e5733883421495 Dmitry Bogdanov    2022-07-18  503  		}
1e5733883421495 Dmitry Bogdanov    2022-07-18  504  		if (initiatorchg_len =
> 1024) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  505  			pr_err("CHAP_C excee=
ds maximum binary size of 1024 bytes\n");
1e5733883421495 Dmitry Bogdanov    2022-07-18  506  			goto out;
1e5733883421495 Dmitry Bogdanov    2022-07-18  507  		}
1e5733883421495 Dmitry Bogdanov    2022-07-18  508 =20
1e5733883421495 Dmitry Bogdanov    2022-07-18  509  		if (hex2bin(initiator=
chg_binhex, initiatorchg,
1e5733883421495 Dmitry Bogdanov    2022-07-18  510  			    initiatorchg_len=
) < 0) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  511  			pr_err("Malformed CH=
AP_C: invalid HEX\n");
1e5733883421495 Dmitry Bogdanov    2022-07-18  512  			goto out;
1e5733883421495 Dmitry Bogdanov    2022-07-18  513  		}
1e5733883421495 Dmitry Bogdanov    2022-07-18  514  		break;
1e5733883421495 Dmitry Bogdanov    2022-07-18  515  	case BASE64:
1e5733883421495 Dmitry Bogdanov    2022-07-18  516  		initiatorchg_len =3D =
chap_base64_decode(initiatorchg_binhex,
1e5733883421495 Dmitry Bogdanov    2022-07-18  517  						      initiatorch=
g,
1e5733883421495 Dmitry Bogdanov    2022-07-18  518  						      strlen(init=
iatorchg));
1e5733883421495 Dmitry Bogdanov    2022-07-18  519  		if (initiatorchg_len =
< 0) {
1e5733883421495 Dmitry Bogdanov    2022-07-18  520  			pr_err("Malformed CH=
AP_C: invalid BASE64\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  521  			goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  522  		}
f9fab3d9860050e Maurizio Lombardi  2019-10-17  523  		if (!initiatorchg_len=
) {
e48354ce078c079 Nicholas Bellinger 2011-07-23  524  			pr_err("Unable to co=
nvert incoming challenge\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  525  			goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  526  		}
f9fab3d9860050e Maurizio Lombardi  2019-10-17  527  		if (initiatorchg_len =
> 1024) {
e4fae2318b5ddd7 Nicholas Bellinger 2014-06-13  528  			pr_err("CHAP_C excee=
ds maximum binary size of 1024 bytes\n");
e4fae2318b5ddd7 Nicholas Bellinger 2014-06-13  529  			goto out;
e4fae2318b5ddd7 Nicholas Bellinger 2014-06-13  530  		}
1e5733883421495 Dmitry Bogdanov    2022-07-18  531  		break;
1e5733883421495 Dmitry Bogdanov    2022-07-18  532  	default:
1e5733883421495 Dmitry Bogdanov    2022-07-18  533  		pr_err("Could not fin=
d CHAP_C.\n");
1816494330a83f2 Vincent Pelletier  2018-09-09  534  		goto out;
1816494330a83f2 Vincent Pelletier  2018-09-09  535  	}
1e5733883421495 Dmitry Bogdanov    2022-07-18  536 =20
f9fab3d9860050e Maurizio Lombardi  2019-10-17  537  	pr_debug("[server] Got=
 CHAP_C=3D%s\n", initiatorchg);
1d2b60a5545942b Nicholas Bellinger 2014-06-05  538  	/*
1d2b60a5545942b Nicholas Bellinger 2014-06-05  539  	 * During mutual authe=
ntication, the CHAP_C generated by the
1d2b60a5545942b Nicholas Bellinger 2014-06-05  540  	 * initiator must not =
match the original CHAP_C generated by
1d2b60a5545942b Nicholas Bellinger 2014-06-05  541  	 * the target.
1d2b60a5545942b Nicholas Bellinger 2014-06-05  542  	 */
f9fab3d9860050e Maurizio Lombardi  2019-10-17  543  	if (initiatorchg_len =
=3D=3D chap->challenge_len &&
f9fab3d9860050e Maurizio Lombardi  2019-10-17  544  				!memcmp(initiatorch=
g_binhex, chap->challenge,
f9fab3d9860050e Maurizio Lombardi  2019-10-17  545  				initiatorchg_len)) {
1d2b60a5545942b Nicholas Bellinger 2014-06-05  546  		pr_err("initiator CHA=
P_C matches target CHAP_C, failing"
1d2b60a5545942b Nicholas Bellinger 2014-06-05  547  		       " login attemp=
t\n");
1d2b60a5545942b Nicholas Bellinger 2014-06-05  548  		goto out;
1d2b60a5545942b Nicholas Bellinger 2014-06-05  549  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  550  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  551  	 * Generate CHAP_N and=
 CHAP_R for mutual authentication.
e48354ce078c079 Nicholas Bellinger 2011-07-23  552  	 */
d75081a34e037b1 Eric Biggers       2026-04-21  553  	ret =3D chap_digest_in=
it(&digest_ctx, chap->digest_type);
e48354ce078c079 Nicholas Bellinger 2011-07-23  554  	if (ret < 0) {
d75081a34e037b1 Eric Biggers       2026-04-21  555  		pr_err("chap_digest_i=
nit() failed\n");
e48354ce078c079 Nicholas Bellinger 2011-07-23  556  		goto out;
e48354ce078c079 Nicholas Bellinger 2011-07-23  557  	}
e48354ce078c079 Nicholas Bellinger 2011-07-23  558 =20
7ac9ad11b2a5cf7 Andy Grover        2013-03-04  559  	/* To handle both endi=
annesses */
7ac9ad11b2a5cf7 Andy Grover        2013-03-04  560  	id_as_uchar =3D id;
d75081a34e037b1 Eric Biggers       2026-04-21  561  	chap_digest_update(&di=
gest_ctx, &id_as_uchar, 1);
e48354ce078c079 Nicholas Bellinger 2011-07-23  562 =20
d75081a34e037b1 Eric Biggers       2026-04-21  563  	chap_digest_update(&di=
gest_ctx, auth->password_mutual,
e48354ce078c079 Nicholas Bellinger 2011-07-23  564  			   strlen(auth->pass=
word_mutual));
e48354ce078c079 Nicholas Bellinger 2011-07-23  565  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  566  	 * Convert received ch=
allenge to binary hex.
e48354ce078c079 Nicholas Bellinger 2011-07-23  567  	 */
d75081a34e037b1 Eric Biggers       2026-04-21  568  	chap_digest_update(&di=
gest_ctx, initiatorchg_binhex, initiatorchg_len);
d75081a34e037b1 Eric Biggers       2026-04-21  569  	chap_digest_final(&dig=
est_ctx, digest);
e48354ce078c079 Nicholas Bellinger 2011-07-23  570 =20
e48354ce078c079 Nicholas Bellinger 2011-07-23  571  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  572  	 * Generate CHAP_N and=
 CHAP_R.
e48354ce078c079 Nicholas Bellinger 2011-07-23  573  	 */
e48354ce078c079 Nicholas Bellinger 2011-07-23  574  	*nr_out_len =3D sprint=
f(nr_out_ptr, "CHAP_N=3D%s", auth->userid_mutual);
e48354ce078c079 Nicholas Bellinger 2011-07-23  575  	*nr_out_len +=3D 1;
e48354ce078c079 Nicholas Bellinger 2011-07-23  576  	pr_debug("[server] Sen=
ding CHAP_N=3D%s\n", auth->userid_mutual);
e48354ce078c079 Nicholas Bellinger 2011-07-23  577  	/*
e48354ce078c079 Nicholas Bellinger 2011-07-23  578  	 * Convert response fr=
om binary hex to ascii hext.
e48354ce078c079 Nicholas Bellinger 2011-07-23  579  	 */
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  580  	bin2hex(response, dige=
st, chap->digest_size);
e48354ce078c079 Nicholas Bellinger 2011-07-23  581  	*nr_out_len +=3D sprin=
tf(nr_out_ptr + *nr_out_len, "CHAP_R=3D0x%s",
e48354ce078c079 Nicholas Bellinger 2011-07-23  582  			response);
e48354ce078c079 Nicholas Bellinger 2011-07-23  583  	*nr_out_len +=3D 1;
e48354ce078c079 Nicholas Bellinger 2011-07-23  584  	pr_debug("[server] Sen=
ding CHAP_R=3D0x%s\n", response);
e48354ce078c079 Nicholas Bellinger 2011-07-23  585  	auth_ret =3D 0;
e48354ce078c079 Nicholas Bellinger 2011-07-23  586  out:
f9fab3d9860050e Maurizio Lombardi  2019-10-17  587  	kfree(initiatorchg);
f9fab3d9860050e Maurizio Lombardi  2019-10-17  588  	kfree(initiatorchg_bin=
hex);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  589  	kfree(digest);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  590  	kfree(response);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  591  	kfree(server_digest);
a572d24af4d16e7 Maurizio Lombardi  2019-10-28  592  	kfree(client_digest);
e48354ce078c079 Nicholas Bellinger 2011-07-23  593  	return auth_ret;
e48354ce078c079 Nicholas Bellinger 2011-07-23 @594  }
e48354ce078c079 Nicholas Bellinger 2011-07-23  595 =20

:::::: The code at line 594 was first introduced by commit
:::::: e48354ce078c079996f89d715dfa44814b4eba01 iscsi-target: Add iSCSI fab=
ric support for target v4.1

:::::: TO: Nicholas Bellinger <nab@linux-iscsi.org>
:::::: CC: Nicholas Bellinger <nab@linux-iscsi.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
