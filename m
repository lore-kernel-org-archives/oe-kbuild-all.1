Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223E8E565
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 17:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690739200; x=1722275200;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=eAJaSkAChynKE4gOAwYxOwtGsW24N7yRZED4KOGAT4w=;
  b=iSkqbJduB6yRf5hlaaXKJICTddNSMkhqem3A3/MKK2iSEJE/7HY+lMpC
   CtZ3BMoa4IefiKRFJtAFqCUx5Kf9UeIwlTIEfH6hMlCvUFCqH+mXtCZJ+
   07gRbv1g+kDFCsb+mkkFriwaa+zzQgbt1CLbNpf5rM0ISifV9j0Fv6xQz
   FdJ8ESVjET5eErXRb5e4lrAkFt5Ta3Ikd77AYELn21f2NzT6Ls9ztSkC2
   g9z/k8tWWYcxWguBC8Q0aq8gEvBXYe+wlcDe4ipXJUMUc8JEe2At0ozOP
   igVKupV/S3ki2iFcwJQncIX+uxJ+CuQZOBmtu05hPH85HqeHyCZkrxLtb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="366343198"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="366343198"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 10:46:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="793462026"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="793462026"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP; 30 Jul 2023 10:46:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 30 Jul 2023 10:46:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 30 Jul 2023 10:46:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 30 Jul 2023 10:46:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/c1UxreBtI6WxxR7xfoV6v4hLngNWKyy+n7nS/yDjAxShJx3szviy7U9Qh246/awIy5s68abDdPUVIh778H4mR3GZeOig0UeN4BOcq5iHYMDsqoTIDEr+OZ2o5xKtad0aHlYCFCTciU+w6I1exMe0ODLEmL3PMllSqfAwA+B8KJH8zIsj+6r8osNsDKq+IeY/dBnVufwRXD0MZ6O9mUar4/4mKH39bhrplkvpq9tUEgHOxmHN8o+gJ4Qq4jk8FO8Fd7XOjclvDqgPClLATWbdCUHp4oOYZbUQLGHuCt15XPk9yNUCyJV3JhXenNoPQoNsNTwg09/xyVP3CWLo4RNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adxlE8vkQtRr2nAj3dlB1q5iiqfPqbO0ogMfojQ1Mto=;
 b=TfQ6wJNpLyYQhEqs7OGbYavMtU0Cbd9NFdyLLFjqM/STMn2itBDr4HEZ/YSPL/rev7ntiyXIdrYqISYyGw2Cmg81edLdXziEvtmkJqO1ou+9eXKzUesfL2dOCPwZiBLXLsqa9+wFZ91yKuXe45ecfmk+JkJ16SO0KFq4vKWphVKuyYGQW/QHzuU5BK7jVauAWYiv1bLOtp/fJ8Y6vZm2k+0sDp29ua7ZxtWkN8GFHTUO4wfvv6aFSE690ybi4iGIjYt2zX9imjFsFwJqX1VfqHqWfdoEki+tX9yLTscy6KT29VerouQQEr1Q1rj1UYwlvHdibdC+uxS8jGEMUIJhaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4093.namprd11.prod.outlook.com (2603:10b6:208:13f::21)
 by DS0PR11MB7285.namprd11.prod.outlook.com (2603:10b6:8:13d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Sun, 30 Jul
 2023 17:46:32 +0000
Received: from MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::63d1:e2f7:dd1f:c047]) by MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::63d1:e2f7:dd1f:c047%7]) with mapi id 15.20.6631.042; Sun, 30 Jul 2023
 17:46:31 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, lkp <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: [char-misc:char-misc-testing 5/9]
 include/linux/moduleparam.h:24:9: error: expected ',' or ';' before 'static'
Thread-Topic: [char-misc:char-misc-testing 5/9]
 include/linux/moduleparam.h:24:9: error: expected ',' or ';' before 'static'
Thread-Index: AQHZwv1KfoymJ7tzl0yFE+zsOMZxSq/SfAiAgAABRQCAABNycA==
Date: Sun, 30 Jul 2023 17:46:31 +0000
Message-ID: <MN2PR11MB4093128DC829C1BA6AFA3F68E504A@MN2PR11MB4093.namprd11.prod.outlook.com>
References: <202307302340.4uDUBI3T-lkp@intel.com>
 <2023073042-reroute-handball-d944@gregkh>
 <2023073031-hypnosis-laborer-4ebb@gregkh>
In-Reply-To: <2023073031-hypnosis-laborer-4ebb@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4093:EE_|DS0PR11MB7285:EE_
x-ms-office365-filtering-correlation-id: c17fc9a5-45a5-41c0-c265-08db9124e8cf
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6k8drf0Hfa1F7EObQ2kJ2usNxgP+sPMO1t1mt2Y9QnDtGkkYD/JBL6rstB/wHIaqVVpDeDbFFlWF+l+f30qhMCTqGa5J0VdffqEGYfPqPqULLbaRlXHa9haq8nVCHWpjibFwyp0kFBfelOjMXr8O65sDOG0UeTV69p/tqpKIARZHrmPjx6FLIYSgkaKgiyduDa0YaBuqUQIT17Fx/+cWCEKE2dwPMxa5tuBByi3Fw97BeX/mxZk3Fb/YCZt7e4HpJmj06ZI1u5i0d4sCe7rvM6kVrP2B8iIVnVnPb/gmVyS0qyV549gDZdUgJIuwYKJv1wkWzUnVkVR0Ml6bORKr2IK/rtQRKKB6jFc+vWxa8xivr53Rkyfvd6DhORapJhU6RbjT/cPKKr7EO+vSraNEJ4N0vHzHSRUBIj0672ipL/nYE01PmuskIRVjbVVc4+6tJAiSssEK0HCmBKUQtfa5WKJA3V3WCDpNZmrBPpxYIMBidOngo7GFzSWWCqNIhZftawYMwHDesICDI6KDnHlCgxrXmm33xLMwee+H/HfasNkrxbYbMhQ2WsjPnkheAH9YwGvs5jy7XALUjnv/s6rPHh43fnFivoeI6JXow3tHKYo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4093.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(38100700002)(82960400001)(122000001)(55016003)(86362001)(38070700005)(33656002)(9686003)(966005)(478600001)(71200400001)(7696005)(53546011)(186003)(6506007)(26005)(8676002)(8936002)(5660300002)(52536014)(76116006)(66946007)(66556008)(66476007)(2906002)(66446008)(64756008)(110136005)(41300700001)(316002)(4744005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G77ypGSDzw6JTV3W+iohQjhjfiQtijQOOkOGcK6mFEFWos1Tm2Wn1gZ3n+x2?=
 =?us-ascii?Q?rdSomeWZ66m6NMYKyzxRtP+rjV13sqG0K3QdGbgV17FKCZtKwEA38xHeH0Cl?=
 =?us-ascii?Q?R1mNRXplRHQEA743Anw+FP1/L7OnKv/V6/OHd63pgZtPqvRAHkR1hx36qV2G?=
 =?us-ascii?Q?QBVVdlRuLNKePNwCLPGJjPMybEZeqcGawRskaJ1+fggWcjDV3+0vnLEXMiy1?=
 =?us-ascii?Q?vZV4hQoV0hEK8qaD8AMIIO6giReclvSFQad3bRGlhrH55E9uDIP4wLejIgMV?=
 =?us-ascii?Q?CUSP+B96c2aqlxnVMcaC7xUnKG0ydWvZ/GkKRplvx6yrBc/a4ZuS+EULZ3/7?=
 =?us-ascii?Q?0uW4uZ/P6q84pWVw9jQsymAd73AaOJejVnwbNz34EBgioKyhtWQSBP82zc5/?=
 =?us-ascii?Q?+W+Pw85vtGHKvgjVSM5DI5pbAbWKTKW+fHq+8oegfkcgpRaQXfdL+ZGCuRI9?=
 =?us-ascii?Q?euhQSf68Yv9SOHOzmF/e02YiPjcT++3blVn4H4ACj3QR/Z+Q/V3p6n8hO1re?=
 =?us-ascii?Q?nNcX+emyk/OmMnnkJdoVaLnk7OJb++Gj+wR5sNE/EltkbF+g0HgVZcv8Xx0e?=
 =?us-ascii?Q?HAmt1mFqWddz232ujTa+4c/nyxIPQ21eZjfLgQX65rIG11JHFrBmUCGpgiko?=
 =?us-ascii?Q?ySqXbLl6O1ROG+TYHPLjO7s6eIeHcbv5GjQej9UwDd63hJ0FCRO7hwl7GYBM?=
 =?us-ascii?Q?g4YAhCe5ER583GTHaIjxoXEDPnec4ghEeRFaPP1EBAJSfXnCNqsshV5PmiGK?=
 =?us-ascii?Q?K/6Xf+qPBG0tWmDjh5ATBUirBlw8QOcJjcuRbGJXvJhlSZXAK02dqvlQX8pa?=
 =?us-ascii?Q?OGR5f0sODGomk3my0KBHcOpe7w6niUgU8jwax/gcTvuOjy1mhJzYlZj/EvTm?=
 =?us-ascii?Q?Y7SfrIMPzSZ4KLR0uq+tVkS58QZNB0Tl8rvw9IXyCGbhmKwK9yl+/iK1Rdhd?=
 =?us-ascii?Q?UQfhy8MypktwRAL0dqInylSKp3FkgXyCRXbYHmEHKwKA7TVNGIOHWMOQfyuS?=
 =?us-ascii?Q?ITvm+MT3YNcJ6hDxU4tLlgRK/lMk+4KMAEWn0czKJBYj/iLblC8oZQhsQ8w1?=
 =?us-ascii?Q?iiRuEP/hhS72wphr5s3EtmUv/Fnd8SbtDbjw77CT7j0ixFFOfAURAOpWoRd5?=
 =?us-ascii?Q?mbJdHi7u24jtTj4ZHqE6BB1LN0qJ5PlgeqcNJBQY452XNE4b6i1tBoWw5ybi?=
 =?us-ascii?Q?87pQwMO6wNG4mtZoF1zgQt2pY+Kjtzk9syMXQQJGBES8IkepweWomcz2XVBj?=
 =?us-ascii?Q?v6Yb4xtNwDNJwMl7HTgIaxSo4HT2dQTPXvDJWwYw50Z9D1i2upkKBPzhUBQh?=
 =?us-ascii?Q?PSU9SRYG4wmyCcogwUDOgpka8wYnblENhvXAkvZrJKRc7dS+sfNTUo5Sdc0j?=
 =?us-ascii?Q?9mFRnNyY03empg6aSzcRC1hcCuLWCTkdTAoCOeqV4ClMUy9izxiO5jsXEgm3?=
 =?us-ascii?Q?6FjVOOjPXWPT+37Sq0Fds/fst011iIXWNnpkTvvn4QcwTLscqqQQQ0Vby6yK?=
 =?us-ascii?Q?v/gaaXB3qGBaceFGtl5FPSqlrYXCM0iJkfqUMIwLO9qmwz4XXakqWv0ZTHWb?=
 =?us-ascii?Q?IusOaHw7eewVCfDPV8ETZtZVfTuzLFmHgMktn2cu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17fc9a5-45a5-41c0-c265-08db9124e8cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2023 17:46:31.3253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Snh+WRxq9Vg6Jjb4dN4ijXSo8/yiH61JZNhTDPjKAOj8jWmYkFclgr6f8BBQafRNlkMpVd6HB3CTMTly7U4B3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7285
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Sunday, July 30, 2023 7:20 PM
> To: lkp <lkp@intel.com>; Winkler, Tomas <tomas.winkler@intel.com>; oe-
> kbuild-all@lists.linux.dev
> Subject: Re: [char-misc:char-misc-testing 5/9]
> include/linux/moduleparam.h:24:9: error: expected ',' or ';' before 'stat=
ic'
>=20
> On Sun, Jul 30, 2023 at 06:15:07PM +0200, Greg Kroah-Hartman wrote:
> > On Sun, Jul 30, 2023 at 11:47:52PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-
> misc.git char-misc-testing
> > > head:   94e4fbf7c8756d824c51c04be3b58588d67411a4
> > > commit: c8de1d2815aa6669b319d2d71401f35b68bb9aa9 [5/9] mei: gsc:
> add module description
> >
> > I'll go drop this as obviously it was not actually compiled by anyone :=
(
>=20
> Nevermind, I fixed it up by hand...
Thanks, sorry for the mess.=20
