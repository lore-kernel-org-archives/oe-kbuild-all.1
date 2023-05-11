Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FCF2772C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 07:00:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7F32D21888;
	Thu, 11 May 2023 07:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683788447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ug3fRGfZ6RltEDVbw8+cd7QvQGAOD10fEfn0cOVts6s=;
	b=IYTc4G7pLzpRY1jaQtiSA2YUVi8lshfpJcmG8mmGU9//F6EHEPBJPXVMYDNtW2veZ8tyAs
	C6i5j8lkB+M0gfPR9MUH2oa0x7OlHSniDNM4OG2GgC0GGuWyqLAkI1PMVHxJu6b8pt9YIM
	vcUFT0AzdXPgRIfYmRL13cVnEJPkmdg=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60917134B2;
	Thu, 11 May 2023 07:00:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id e4ArFp+SXGTySwAAMHmgww
	(envelope-from <jgross@suse.com>); Thu, 11 May 2023 07:00:47 +0000
Message-ID: <78877861-9995-467a-c36e-efdd05609e40@suse.com>
Date: Thu, 11 May 2023 09:00:46 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [bp:rc1-mtrr 2/16] ./usr/include/asm/mtrr.h:88:9: error: unknown
 type name 'bool'
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202305110003.WD5XnBVn-lkp@intel.com>
 <20230510191230.GEZFvsnsMTS/iIEZmV@fat_crate.local>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230510191230.GEZFvsnsMTS/iIEZmV@fat_crate.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sc80WBPvuXn3F8zU2P2giir9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sc80WBPvuXn3F8zU2P2giir9
Content-Type: multipart/mixed; boundary="------------LritW9RiPnlQ096q0ahORq0W";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Message-ID: <78877861-9995-467a-c36e-efdd05609e40@suse.com>
Subject: Re: [bp:rc1-mtrr 2/16] ./usr/include/asm/mtrr.h:88:9: error: unknown
 type name 'bool'
References: <202305110003.WD5XnBVn-lkp@intel.com>
 <20230510191230.GEZFvsnsMTS/iIEZmV@fat_crate.local>
In-Reply-To: <20230510191230.GEZFvsnsMTS/iIEZmV@fat_crate.local>

--------------LritW9RiPnlQ096q0ahORq0W
Content-Type: multipart/mixed; boundary="------------HZjmh0s2XMGWULAmuWGZFWRD"

--------------HZjmh0s2XMGWULAmuWGZFWRD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDUuMjMgMjE6MTIsIEJvcmlzbGF2IFBldGtvdiB3cm90ZToNCj4gT24gVGh1LCBN
YXkgMTEsIDIwMjMgYXQgMDE6MDA6MjlBTSArMDgwMCwga2VybmVsIHRlc3Qgcm9ib3Qgd3Jv
dGU6DQo+PiBBbGwgZXJyb3JzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6DQo+Pg0KPj4g
ICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSA8Y29tbWFuZC1saW5lPjoNCj4+Pj4gLi91c3Iv
aW5jbHVkZS9hc20vbXRyci5oOjg4Ojk6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAnYm9v
bCcNCj4+ICAgICAgICA4OCB8ICAgICAgICAgYm9vbCBoYXZlX2ZpeGVkOw0KPj4gICAgICAg
ICAgIHwgICAgICAgICBefn5+DQo+Pg0KPiANCj4gSSB3YXMgd29uZGVyaW5nIGhvdyBURiBp
dCBkb2Vzbid0IGtub3cgYm9vbC4NCj4gDQo+IEJVVCwgeW91J3ZlIG1pc3NlZCBvbmUgaW1w
b3J0YW50IGxpbmUgZnJvbSB0aGUgYnVpbGQgbG9nIHdoaWNoIGlzDQo+IHRoZSBwcmVjZWRp
bmcgb25lOg0KPiANCj4gICAgSERSVEVTVCB1c3IvaW5jbHVkZS9hc20vbXRyci5oDQo+ICAg
IF5eXl5eXl5eXl4NCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIDxjb21tYW5kLWxpbmU+Og0K
PiAuL3Vzci9pbmNsdWRlL2FzbS9tdHJyLmg6ODg6OTogZXJyb3I6IHVua25vd24gdHlwZSBu
YW1lIOKAmGJvb2zigJkNCj4gICAgIDg4IHwgICAgICAgICBib29sIGhhdmVfZml4ZWQ7DQo+
ICAgICAgICB8ICAgICAgICAgXn5+fg0KDQpfSV8gZGlkbid0IG1pc3MgYW55dGhpbmcuIEl0
IHdhcyB5b3Ugd2hvIGNoYW5nZWQgdGhhdCB0byBib29sLiA6LSkNCg0KPiANCj4gdGhhdCdz
IHRoZSBoZWFkZXIgdGVzdCBndW5rIHdoaWNoIGRvZXM6DQo+IA0KPiBnY2MtMTEgLXN0ZD1j
OTAgLVdhbGwgLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbiAtbTY0IC1X
cCwtTU1ELHVzci9pbmNsdWRlL2FzbS8ubXRyci5oZHJ0ZXN0LmQgLUkgdXNyL2luY2x1ZGUg
LUkgLi91c3IvZHVtbXktaW5jbHVkZSAtZnN5bnRheC1vbmx5IC14IGMgL2Rldi9udWxsICAt
aW5jbHVkZSB1c3IvaW5jbHVkZS9hc20vbXRyci5oIC1pbmNsdWRlIHVzci9pbmNsdWRlL2Fz
bS9tdHJyLmgNCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIDxjb21tYW5kLWxpbmU+Og0KPiAu
L3Vzci9pbmNsdWRlL2FzbS9tdHJyLmg6ODg6OTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1l
IOKAmGJvb2zigJkNCj4gICAgIDg4IHwgICAgICAgICBib29sIGhhdmVfZml4ZWQ7DQo+ICAg
ICAgICB8DQo+IA0KPiBBbmQsIG9mYywgc3RydWN0IG10cnJfc3RhdGVfdHlwZSBoYXMgbm8g
cGxhY2UgaW4gdGhlIHVhcGkgaGVhZGVyOg0KDQpZZXMsIEkgYWdyZWUgd2l0aCB0aGF0Lg0K
DQoNCkp1ZXJnZW4NCg==
--------------HZjmh0s2XMGWULAmuWGZFWRD
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------HZjmh0s2XMGWULAmuWGZFWRD--

--------------LritW9RiPnlQ096q0ahORq0W--

--------------sc80WBPvuXn3F8zU2P2giir9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRckp4FAwAAAAAACgkQsN6d1ii/Ey//
DAf+OdONVSJNH4uZpnsIfeZp04b1wMHmQegiy5iDYhhnYyvWp0uCcDjrJfTkQSXxmyh9J/SUVi7u
DU7tN3vvvXLkaKHPZ3azwE0TkRJWEla4XsUt+bjaaDvZ5pn0H+DpSiEBCN32IIJpWPjRV6l8VkjR
5FZ/DKFQ9STJfgbaiI0H1UHoKWMfl0hOP5ojtM4HV857ICZiw98mU3Ymoc1n4A4ZTHZuk0JUYtVn
3CmbBW64qF96OL+f8ITp+KaEnU7NL2Ukb3k6DTIj5oNgSzAX0Q/46Ok90mR47XivKE18DHI2Wfln
Cgpg3XaHjhZfP/vdB/GK+n+R39StWIPCor74/AOlpA==
=Muhz
-----END PGP SIGNATURE-----

--------------sc80WBPvuXn3F8zU2P2giir9--
