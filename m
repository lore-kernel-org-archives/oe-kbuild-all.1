Content-Type: multipart/mixed; boundary="===============9123937303426511183=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 2/3] crypto: hisilicon/sec - add fallback tfm supporting for XTS mode
Date: Mon, 31 May 2021 08:51:30 +0800
Message-ID: <7c435436-cf38-7c09-9141-8410a8c18cc8@intel.com>
In-Reply-To: <c265adb3-4cba-a6f7-6ba5-9a065fe5aeca@huawei.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9123937303426511183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/29/21 5:22 PM, yekai(A) wrote:
>
>
> On 2021/5/28 22:13, kernel test robot wrote:
>> Hi Kai,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on cryptodev/master]
>> [also build test ERROR on crypto/master linux/master linus/master =

>> v5.13-rc3 next-20210528]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url: =

>> https://github.com/0day-ci/linux/commits/Kai-Ye/crypto-hisilicon-support=
s-new-skciphers-for-new-hardware/20210528-194644
>> base: =

>> https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.gi=
t =

>> master
>> config: ia64-allmodconfig (attached as .config)
>> compiler: ia64-linux-gcc (GCC) 9.3.0
>> reproduce (this is a W=3D1 build):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wget =

>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross =

>> -O ~/bin/make.cross
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chmod +x ~/bin/make.cross
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =

>> https://github.com/0day-ci/linux/commit/60bae5ed49c53ea90c82125a8295fb72=
833a3b68
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git remote add linux-review h=
ttps://github.com/0day-ci/linux
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git fetch --no-tags linux-rev=
iew =

>> Kai-Ye/crypto-hisilicon-supports-new-skciphers-for-new-hardware/20210528=
-194644
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git checkout 60bae5ed49c53ea9=
0c82125a8295fb72833a3b68
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # save the attached .config t=
o linux build tree
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER_INSTALL_PATH=3D$HOME=
/0day COMPILER=3Dgcc-9.3.0 =

>> make.cross ARCH=3Dia64
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>> =C2=A0=C2=A0 drivers/crypto/hisilicon/sec2/sec_crypto.c: In function =

>> 'sec_aead_crypto':
>>>> drivers/crypto/hisilicon/sec2/sec_crypto.c:1751:40: error: 'sk_req' =

>>>> undeclared (first use in this function); did you mean 'a_req'?
>> =C2=A0=C2=A0=C2=A0 1751 |=C2=A0=C2=A0 return sec_skcipher_soft_crypto(ct=
x, sk_req, encrypt);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a_req
>> =C2=A0=C2=A0 drivers/crypto/hisilicon/sec2/sec_crypto.c:1751:40: note: e=
ach =

>> undeclared identifier is reported only once for each function it =

>> appears in
>>
>>
>> vim +1751 drivers/crypto/hisilicon/sec2/sec_crypto.c
>>
>> =C2=A0 1733
>> =C2=A0 1734=C2=A0=C2=A0=C2=A0 static int sec_aead_crypto(struct aead_req=
uest *a_req, bool =

>> encrypt)
>> =C2=A0 1735=C2=A0=C2=A0=C2=A0 {
>> =C2=A0 1736=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct crypto_aead=
 *tfm =3D crypto_aead_reqtfm(a_req);
>> =C2=A0 1737=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sec_req *re=
q =3D aead_request_ctx(a_req);
>> =C2=A0 1738=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sec_ctx *ct=
x =3D crypto_aead_ctx(tfm);
>> =C2=A0 1739=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 1740
>> =C2=A0 1741=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req->flag =3D a_re=
q->base.flags;
>> =C2=A0 1742=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req->aead_req.aead=
_req =3D a_req;
>> =C2=A0 1743=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req->c_req.encrypt=
 =3D encrypt;
>> =C2=A0 1744=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req->ctx =3D ctx;
>> =C2=A0 1745
>> =C2=A0 1746=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D sec_aead_p=
aram_check(ctx, req);
>> =C2=A0 1747=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(ret))
>> =C2=A0 1748=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return -EINVAL;
>> =C2=A0 1749
>> =C2=A0 1750=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(ctx->=
c_ctx.fallback))
>>> 1751=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return sec_skcipher_soft_crypto(ctx, sk_req, encrypt);
>> =C2=A0 1752
>> =C2=A0 1753=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ctx->req_op=
->process(ctx, req);
>> =C2=A0 1754=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 1755
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>>
>
>
> You shouldn't git am this patchset directly, because this patchset =

> depends on previous patchset.
> the series is "crypto: hisilicon - add new type of sqe for Kunpeng930",
> the patchwork is =

> https://patchwork.kernel.org/project/linux-crypto/list/?series=3D490143,
> thank you
> Kai

Hi Kai,

Thanks for the clarification, it could be very helpful for us if =

'--base' for git format-patch used or
there is a patchwork link in cover letter file.

Best Regards,
Rong Chen
--===============9123937303426511183==--

