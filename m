Content-Type: multipart/mixed; boundary="===============2624085113800886264=="
MIME-Version: 1.0
From: Felipe Balbi <balbi@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [balbi-usb:testing/next 78/89] drivers/usb/dwc3/gadget.c:2842:7: error: implicit declaration of function 'DWC3_VER_IS_WITHIN'
Date: Thu, 14 May 2020 15:08:00 +0300
Message-ID: <871rnm4t3z.fsf@kernel.org>
In-Reply-To: <202005141935.h1fCzDvE%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2624085113800886264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kbuild test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tes=
ting/next
> head:   405a813dbc9e261f9a025386c04f0d133996995e
> commit: 1a31a103ce6e5a49c4c04e0709a0da431bcbadd4 [78/89] usb: dwc3: gadge=
t: Use SET_EP_PRIME for NoStream
> config: parisc-allyesconfig (attached as .config)
> compiler: hppa-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 1a31a103ce6e5a49c4c04e0709a0da431bcbadd4
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross=
 ARCH=3Dparisc =

>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> Note: the balbi-usb/testing/next HEAD 405a813dbc9e261f9a025386c04f0d13399=
6995e builds fine.
>       It only hurts bisectibility.
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):

Thanks, I've reordered the commits to avoid this problem.

-- =

balbi

--===============2624085113800886264==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVsTHpoN3duOTZD
WHdqaDJJekw2NG1lRWFtUVlGQWw2OU5LQUFDZ2tRekw2NG1lRWEKbVFibVdoQUF0UWoyQkdxcys5
T0Evb2krWUkzYXJIakpmVmpuYkFpUDdRQW5sd3ZTVmJESFJGa1JqWGdPV09aTApHY2dRaEZXbDFB
dlZ1MnNzbEZQMm5SZ3pFOGwrcGhIbUFTci95emNsQzY5WHU3Z0RFZVRQVVovbnZ1SUI0NkNMCkZp
bk1DT0xtSTFQZVpwYVpSaE82M3lua3pPM1BDakdhNXo0eFd5dGM4MVBJWnBlK2tXZUtMd3BuYWRB
K2swWXEKcDVBSUtGc1ltZFJCK094aDNicVY3NXhuMmFlS0pPUXByaHBvcDVkb3FzeFFDeXA0TEg3
NDhHbitzdjF1M2lQcApNLzYvcDdzTTFJV2R6S3l2SFpTUVJ4LzF2ZU5oaW9ZMjQxOG1SYXQva2Jt
dTMxYWxFb2MxNnRvRG0zSzZkSm1FCmhVTi9aZXBlU2J5ck1sa1NiaXhVc1AzdDk3dmRNazlxVnVR
SnFtNDdzOEVnWGNleE1qM1NJVHJyWVN5Z3RsL2wKVEFOTVREMmxLaWVkRnpPZHNCSm41eXhIM2t6
OHc3MXlkTHVJUjRhYjU1VFRHczFrQ3Mwc2JvZEpYVStycWJFSApmVSsxNWt4bEJHQVlkeWpWTGUy
T0laYkNZNzJlSXRyY05QdXdJUlNWS0lkN0pDTm5ia1FhT2lrbFR2UTVUbEt3CnpZVkhqQ01TUW9w
cVNKbERicWFscjF2bjh2a2hzR1VmTTV0MkgxMCtIV3VKd1NGOGZ6Y0RkalA3QkpwQXhPekcKa2JE
WFdYZi9paHc5L3RwWndpb0h4VmJvUGJPNFlSVVVGRFNuUm1nTjM3S2tyM1NtVE5PVzRDek5QR1F2
dG0xNwpRV3A4M1NJcFh1VXhWSVVWZVpnTFdDVEJtWFlxOTBJbE5RbnluVFYwYnI1MnZrOU9lZDA9
Cj1xTTVXCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ==
--===============2624085113800886264==--

