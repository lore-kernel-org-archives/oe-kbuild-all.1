Content-Type: multipart/mixed; boundary="===============8732872544271116421=="
MIME-Version: 1.0
From: yekai(A) <yekai13@huawei.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 2/3] crypto: hisilicon/sec - add fallback tfm supporting for XTS mode
Date: Mon, 31 May 2021 09:22:50 +0800
Message-ID: <ee6a4b40-de82-57e9-ba7a-4e3aceac12a4@huawei.com>
In-Reply-To: <7c435436-cf38-7c09-9141-8410a8c18cc8@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8732872544271116421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2021/5/31 8:51, Rong Chen wrote:
>
>
> On 5/29/21 5:22 PM, yekai(A) wrote:
>>
>>
>> On 2021/5/28 22:13, kernel test robot wrote:
>>> Hi Kai,
>>>
>>> Thank you for the patch! Yet something to improve:
>>>
>>> [auto build test ERROR on cryptodev/master]
>>> [also build test ERROR on crypto/master linux/master linus/master
>>> v5.13-rc3 next-20210528]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch]
>>>
>>> url:
>>> https://github.com/0day-ci/linux/commits/Kai-Ye/crypto-hisilicon-suppor=
ts-new-skciphers-for-new-hardware/20210528-194644
>>>
>>> base:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.g=
it
>>> master
>>> config: ia64-allmodconfig (attached as .config)
>>> compiler: ia64-linux-gcc (GCC) 9.3.0
>>> reproduce (this is a W=3D1 build):
>>>         wget
>>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
>>> -O ~/bin/make.cross
>>>         chmod +x ~/bin/make.cross
>>>         #
>>> https://github.com/0day-ci/linux/commit/60bae5ed49c53ea90c82125a8295fb7=
2833a3b68
>>>
>>>         git remote add linux-review https://github.com/0day-ci/linux
>>>         git fetch --no-tags linux-review
>>> Kai-Ye/crypto-hisilicon-supports-new-skciphers-for-new-hardware/2021052=
8-194644
>>>
>>>         git checkout 60bae5ed49c53ea90c82125a8295fb72833a3b68
>>>         # save the attached .config to linux build tree
>>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0
>>> make.cross ARCH=3Dia64
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>    drivers/crypto/hisilicon/sec2/sec_crypto.c: In function
>>> 'sec_aead_crypto':
>>>>> drivers/crypto/hisilicon/sec2/sec_crypto.c:1751:40: error: 'sk_req'
>>>>> undeclared (first use in this function); did you mean 'a_req'?
>>>     1751 |   return sec_skcipher_soft_crypto(ctx, sk_req, encrypt);
>>>          |                                        ^~~~~~
>>>          |                                        a_req
>>>    drivers/crypto/hisilicon/sec2/sec_crypto.c:1751:40: note: each
>>> undeclared identifier is reported only once for each function it
>>> appears in
>>>
>>>
>>> vim +1751 drivers/crypto/hisilicon/sec2/sec_crypto.c
>>>
>>>   1733
>>>   1734    static int sec_aead_crypto(struct aead_request *a_req, bool
>>> encrypt)
>>>   1735    {
>>>   1736        struct crypto_aead *tfm =3D crypto_aead_reqtfm(a_req);
>>>   1737        struct sec_req *req =3D aead_request_ctx(a_req);
>>>   1738        struct sec_ctx *ctx =3D crypto_aead_ctx(tfm);
>>>   1739        int ret;
>>>   1740
>>>   1741        req->flag =3D a_req->base.flags;
>>>   1742        req->aead_req.aead_req =3D a_req;
>>>   1743        req->c_req.encrypt =3D encrypt;
>>>   1744        req->ctx =3D ctx;
>>>   1745
>>>   1746        ret =3D sec_aead_param_check(ctx, req);
>>>   1747        if (unlikely(ret))
>>>   1748            return -EINVAL;
>>>   1749
>>>   1750        if (unlikely(ctx->c_ctx.fallback))
>>>> 1751            return sec_skcipher_soft_crypto(ctx, sk_req, encrypt);
>>>   1752
>>>   1753        return ctx->req_op->process(ctx, req);
>>>   1754    }
>>>   1755
>>>
>>> ---
>>> 0-DAY CI Kernel Test Service, Intel Corporation
>>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>>>
>>
>>
>> You shouldn't git am this patchset directly, because this patchset
>> depends on previous patchset.
>> the series is "crypto: hisilicon - add new type of sqe for Kunpeng930",
>> the patchwork is
>> https://patchwork.kernel.org/project/linux-crypto/list/?series=3D490143,
>> thank you
>> Kai
>
> Hi Kai,
>
> Thanks for the clarification, it could be very helpful for us if
> '--base' for git format-patch used or
> there is a patchwork link in cover letter file.
>
> Best Regards,
> Rong Chen
> .
>
thanks for your suggestion.

Best Regards
Kai
--===============8732872544271116421==--

