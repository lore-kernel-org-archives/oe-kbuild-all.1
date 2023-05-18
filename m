Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7444F1FA4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 May 2023 22:56:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEbB+597IANuJ95z1eBS77mTNrzdw5cebX1TmKhHpA9dWVB177JvdNpJn1u5Hxs605xm2FQ7FdXBRMoNCvo3Oo0jI4D9h9brOfsd691768yQpVEPY8m6hQ8EnfDqJMjEfnsAp4NUnqgTXb02Bxl4nc3ycppbroIMO+WvVIC+LouFRLCiJdcM0DaffstEJgKk1GwCTuP94Y8gZdInOOCMz8klbmYyy70+b6om9xscXis5usauLxM86RudsudvfUDP5smqML5OYfq1TWT6fIXS4YP7Qy5YE+3uDAdXTE9KA4zGJFmowxUVB7v+KOpxbTWriSRpQOyum/lu4Pt/ezHNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HI8ZT1a/74jsAEhAQ/qmwKmm5UlGJQBMQyWkPXc1o2g=;
 b=Vkmj6TtN+3h0lkAxWUO7WjzPaU9qEL7HxyIQezTk7IH4OirJUFdzQeiWsW0IE4kG+kt0bLf8mZXLGQ0DA57cQkQo7HwCY6M1W5u1L8pGr7aerDfKrcxXc3tR9wIEcag4DF90PVAEuHBO5ZRFNf/3jB0FdEpZQ6m7JKYobJh8MRojekIuQFIiQ/0BmnBxOv7i1/uKV8SrNNbdiVVbW0guc3daqViiGK514PWGLmCgPyfrqx+eDhylYNhLNfqPz/TSesLefsIAX6jbhtONOgKXYbWwKOtHZszS78yjMgpA326j//Wiu/LCLNC4NYsN1NaWBJ20NZhvtsDtVwQzFvG6CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HI8ZT1a/74jsAEhAQ/qmwKmm5UlGJQBMQyWkPXc1o2g=;
 b=je7Wt+ybpkOIMbjS6oFXgdICcT0i7Nc40uroThQMTXuqZx0TR1w6cdWQCpt2ySVRAMaTYmGutP6NWjz9f5uRqmv9rng+K0tn+x9nKszxmoLq6BSHzmmkef+3SnH0u6B21NTkyNAgxk89xazUpfmjWrGQZhMkbsa+fqTRHlJ2YPg=
Received: from DM4PR12MB5133.namprd12.prod.outlook.com (2603:10b6:5:390::6) by
 CH3PR12MB8233.namprd12.prod.outlook.com (2603:10b6:610:129::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 22:56:18 +0000
Received: from DM4PR12MB5133.namprd12.prod.outlook.com
 ([fe80::6a57:5ad4:a5ff:1471]) by DM4PR12MB5133.namprd12.prod.outlook.com
 ([fe80::6a57:5ad4:a5ff:1471%3]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 22:56:18 +0000
From: "Shih, Jude" <Jude.Shih@amd.com>
To: kernel test robot <lkp@intel.com>, "Wang, Yu (Charlie)" <Yu.Wang4@amd.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Kazlauskas, Nicholas"
	<Nicholas.Kazlauskas@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, Sasha Levin <sashal@kernel.org>
Subject: RE: [stable:linux-5.15.y 2434/9999]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:633: warning:
 expecting prototype for dmub_aux_setconfig_reply_callback(). Prototype was
 for dmub_aux_setconfig_callback() instead
Thread-Topic: [stable:linux-5.15.y 2434/9999]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:633: warning:
 expecting prototype for dmub_aux_setconfig_reply_callback(). Prototype was
 for dmub_aux_setconfig_callback() instead
Thread-Index: AQHZicq4HlG6uQShc0igTYkYJWYCVK9gpDOA
Date: Thu, 18 May 2023 22:56:17 +0000
Message-ID:
 <DM4PR12MB5133B1FB66C82DB11C808331F77F9@DM4PR12MB5133.namprd12.prod.outlook.com>
References: <202305190446.IKOYbyhu-lkp@intel.com>
In-Reply-To: <202305190446.IKOYbyhu-lkp@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=fe6c0ade-b291-4b9d-9e11-7ddfbba47031;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-05-18T22:55:50Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5133:EE_|CH3PR12MB8233:EE_
x-ms-office365-filtering-correlation-id: 3eda3d01-70d9-438f-a2f6-08db57f3170a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 d4R7W7N+SnGHC38IOSqneA7qkeLFnHIuJDZAVxZj4xBMUDbIaowTg7E38C6Tqzc9M2GDeQ6WxTRiSTIJBgSTwRPVylWMjeRUYqC+UfSVZsS3OsiF4Dpm2XINhYZEHq/7BftkGJLOeGUCuLh7leFK0PseHDCKMwddknCtXi9W65pPr/KkjkzFdLdKrCPw+5Rxb87++WkFEvdPEjZtTgbI8mSjMjE06RuHlD9s204rA94Og/0P9oqkqUxL9cH3sblON7QhCARVcZMe6BAQkZPHTFC1Jy4HIdv28krV1LQZVbWbg5rIbqWIfCM2xJK8jdyi1I2nSZaUobuRIq7zvr0kc0Qw5Rs8UxmlrhNJ3z0eXSgL0DnZKjU1j2vkcXMhum76DughFajTXFC29ysEwjLkzkSi+a3L+ITMuWaVzvOGPzsohrJKoQsA11fBCiToqwtMUQAyFCl1ED4a0haiOCvkwO8TwcMohXVwspNoF7tmRkNxYXghVb94GeMX8hb055iOy4SEhWM0BBIunhglArgd8MUP47aHWCdeZrgioHmO72T70gYU9WWxg2dZlzy7HMCK07+BpvjZfGdretRqm26aujfVP60XeEDPK1zL5r7x+DUZqkIbrcQ5cvc0UYO3Bt++uZFB0aYdzcez8T1qmm1/WA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5133.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(76116006)(66556008)(64756008)(316002)(66446008)(66476007)(6636002)(4326008)(478600001)(966005)(54906003)(110136005)(33656002)(86362001)(38070700005)(7696005)(83380400001)(53546011)(186003)(26005)(6506007)(66946007)(9686003)(8676002)(8936002)(52536014)(71200400001)(5660300002)(2906002)(55016003)(41300700001)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+a24GKYcz8z9nlILf75o3wzZAhftU7gWfUxBkjSE1DORkyNq+mYCyMdN6DOG?=
 =?us-ascii?Q?ASETEFrTSn7UGUp2O1M0a6sH0XFyQBCMrFJmFF87ClmEUoCMHvxoJQsISSGN?=
 =?us-ascii?Q?JlCQ77E7ODwVnEXWtriH3IT7NcGvBGSiiRMaAIiuP+jGTVIc5H/XReFYTRun?=
 =?us-ascii?Q?q5Zhtfs66Osovud7tteaPyMr41lxkVdiDMA7EzmGnaomtGLmTLIxuNu5in0p?=
 =?us-ascii?Q?8Bz2mLvpD283YJnmo1V3WciJ+eTib+BrJIpxikLQwtHrGMVmqFpz0yvWmgXn?=
 =?us-ascii?Q?W/ukPr2t6eBZmeRyVoryz78k9XaIH7W3x3y4gjTb8Vx3E5XkUU60vDVWQY4H?=
 =?us-ascii?Q?ViIbyd3+E2qs0MTcZcDTPPrlqw+MV4KA7EC6X0LQrjvbLQKgWbqHA9cb1oSs?=
 =?us-ascii?Q?2B8Ox1HYaNVxQ/D/qmKn8OyicJZy2QRMZC5vZLoL/TOXuubK4sJzl1N2WogT?=
 =?us-ascii?Q?FKiwrBNvExiozH9i7brzXjDpWxbWQcs5+VHGdTprdUtF565aykAYenBdCoay?=
 =?us-ascii?Q?byCKJd3GvSihntRlw0kEVIo0aT7YAVEOVUtkHI4erSlMqWw776XO3y5wtmgs?=
 =?us-ascii?Q?WxFVrfJMoSfOlRhEbHWTq6KlzBmOT0VM7bSDpm1qjEd2NehJO6n22jOHfJC+?=
 =?us-ascii?Q?sedcvZq8EB4OfiNb5L0OXVdn1l5gcY+s0tD+N0yNESe87ZSYj/eDRdEBZGWO?=
 =?us-ascii?Q?nYxozMt3w2tBJ3vovxLVVwRZh+gHj8gFLjItHmNh3XTKIxJHtLQZ0nwqPT9G?=
 =?us-ascii?Q?2wpLnNzjBm5uA2/dCnlAQ82Yy1rHJ92Q9ZXS963u+BKQirrxeO7aHhmA964Y?=
 =?us-ascii?Q?AJikbWGTbAquwV78sk5Khmu33sdGB4dACt6qQUKnVOF6kr7eP6JbqMFTkJ7y?=
 =?us-ascii?Q?eTdnAfsiUEkj30QbrH/OBcyfpABPQzEt/KdSsyYbRpOPg+e3e0Uxbb4dLWHJ?=
 =?us-ascii?Q?MOM5zAAZ+f7KsGEeH8O+d4o9kjjI5bwS0ZJg1ve33C++sEIR1DzZjbUamecu?=
 =?us-ascii?Q?oBDlA9qnlt49kKBvcjh0bzh4OKPmetg7De42n5MG0IVD5MB0KwENBchBpUOC?=
 =?us-ascii?Q?khc4ypB1pnZs8w2/k6oJk9C8ewjqKsZ9/E/fguVQdEMJopldfb4L8T/UCyx2?=
 =?us-ascii?Q?UdXYxGklJmHp4nE/FGKLssTIjzvJzYbGENQG6bbPYtqtkaJETO89qff0025d?=
 =?us-ascii?Q?SZ4W7sH5tgiEe9JsA13cOqVejlJcYEy4NIwxUHJxtRJQ1nGJj9ShhzGiZuo4?=
 =?us-ascii?Q?P1tYSBIPJd6FahzYso/Bq0vTmMzBR9RotJ1Ab80rX4sGpK+48MenCyPFabW6?=
 =?us-ascii?Q?5Fnk8BKAM3yv3hNsGAzZ4p5yVhqxFT7NWW0jdSOAHSVRbvjx9RLcHFtvLcVj?=
 =?us-ascii?Q?SFsLwbiQQkISVj9LB5C54aFIBxgiTiUfmpQ/zxByW8vOZi0lAfG3iMrNZEnA?=
 =?us-ascii?Q?QnZ4dvOYSX4IHHF7v/RKOpDc762M+6yCqsle4+Y1U91PkqKud9G2Y8U66FJX?=
 =?us-ascii?Q?CHBFBf5yJ7j+hOnmNUcC9Quz8nxzYnEubXQVm1duO/spqPVjDs4tEzOfmwNx?=
 =?us-ascii?Q?ELP6M3sFaNPH78huYSA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eda3d01-70d9-438f-a2f6-08db57f3170a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 22:56:17.7856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DBFTNq0d9gS4l1ggvso5IALGZrCkbwf1O300f6dPS4CpmCgMyERfB2RlDEW6Zso/nrpb0yb3Xiok5AQTlKukig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8233

[AMD Official Use Only - General]

Add Charlie

-----Original Message-----
From: kernel test robot <lkp@intel.com>
Sent: Friday, May 19, 2023 4:53 AM
To: Shih, Jude <Jude.Shih@amd.com>
Cc: oe-kbuild-all@lists.linux.dev; Greg Kroah-Hartman <gregkh@linuxfoundati=
on.org>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Deucher, Alexa=
nder <Alexander.Deucher@amd.com>; Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 2434/9999] drivers/gpu/drm/amd/amdgpu/../disp=
lay/amdgpu_dm/amdgpu_dm.c:633: warning: expecting prototype for dmub_aux_se=
tconfig_reply_callback(). Prototype was for dmub_aux_setconfig_callback() i=
nstead

Hi Jude,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
.git linux-5.15.y
head:   9d6bde853685609a631871d7c12be94fdf8d912e
commit: 734d5ce02cb069cccedc993d8f1dc0ea41cfa3dd [2434/9999] drm/amd/displa=
y: Support for DMUB HPD interrupt handling
config: sparc-allyesconfig
compiler: sparc64-linux-gcc (GCC) 12.1.0 reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le.git/commit/?id=3D734d5ce02cb069cccedc993d8f1dc0ea41cfa3dd
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/g=
it/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 734d5ce02cb069cccedc993d8f1dc0ea41cfa3dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Dsparc olddefconfig
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Dsparc SHELL=3D/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes:
| https://lore.kernel.org/oe-kbuild-all/202305190446.IKOYbyhu-lkp@intel.
| com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:633:
>> warning: expecting prototype for dmub_aux_setconfig_reply_callback().
>> Prototype was for dmub_aux_setconfig_callback() instead


vim +633 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

   622
   623  /**
   624   * dmub_aux_setconfig_reply_callback - Callback for AUX or SET_CONF=
IG command.
   625   * @adev: amdgpu_device pointer
   626   * @notify: dmub notification structure
   627   *
   628   * Dmub AUX or SET_CONFIG command completion processing callback
   629   * Copies dmub notification to DM which is to be read by AUX comman=
d.
   630   * issuing thread and also signals the event to wake up the thread.
   631   */
   632  void dmub_aux_setconfig_callback(struct amdgpu_device *adev, struct=
 dmub_notification *notify)
 > 633  {
   634          if (adev->dm.dmub_notify)
   635                  memcpy(adev->dm.dmub_notify, notify, sizeof(struct =
dmub_notification));
   636          if (notify->type =3D=3D DMUB_NOTIFICATION_AUX_REPLY)
   637                  complete(&adev->dm.dmub_aux_transfer_done);
   638  }
   639

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
