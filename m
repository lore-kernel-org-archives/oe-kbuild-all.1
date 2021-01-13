Content-Type: multipart/mixed; boundary="===============5103723678710902895=="
MIME-Version: 1.0
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v10 1/1] can: usb: etas_es58X: add support for ETAS ES58X CAN USB interfaces
Date: Wed, 13 Jan 2021 12:13:39 +0900
Message-ID: <CAMZ6RqJNQ8MtLYu6i0Q3POBFYVrnFh3bUjiQC57vv-UqArCLfA@mail.gmail.com>
In-Reply-To: <202101122332.Z7NglWp9-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5103723678710902895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 13 Jan 2021 at 00:29, kernel test robot <lkp@intel.com> wrote:
>
> Hi Vincent,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v5.11-rc3 next-20210111]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]

The patch is applied on linux-can-next/testing. All the warnings
are related to the latest drivers/net/can/dev API changes.

I thought that the test robot only checked the
linux-kernel(a)vger.kernel.org open list and I didn't bother adding
the "--base". So this is my bad, sorry for that.

Because this is a false positive, I will not send a new
version (unless if requested).


Yours sincerely,
Vincent
--===============5103723678710902895==--

