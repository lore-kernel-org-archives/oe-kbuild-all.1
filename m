Content-Type: multipart/mixed; boundary="===============2620382653183491514=="
MIME-Version: 1.0
From: Dan Murphy <dmurphy@ti.com>
To: kbuild-all@lists.01.org
Subject: Re: [ti:ti-linux-5.4.y 1/1] net/hsr/hsr_forward.c:244:3: warning: ignoring return value of function declared with 'warn_unused_result' attribute
Date: Mon, 12 Oct 2020 07:17:52 -0500
Message-ID: <6fa8a876-1ecf-3680-bb0f-654d6aea3157@ti.com>
In-Reply-To: <20201012121204.GC23489@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2620382653183491514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Philip

On 10/12/20 7:12 AM, Philip Li wrote:
> On Mon, Oct 12, 2020 at 08:08:18PM +0800, Philip Li wrote:
>> On Mon, Oct 12, 2020 at 06:42:21AM -0500, Dan Murphy wrote:
>>> Hello robot
>>>
>>> On 10/10/20 2:07 AM, kernel test robot wrote:
>>>> tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-=
5.4.y
>>> Why is this TI tree being reported to the open source community? They h=
ave
>> hi Dan, thanks for the info, this is added automatically, we will
>> disable the test of this repo. Sorry for any confusion.
> oops, I understand the question wrongly. We will keep testing this repo.
> The problem here is it is a clang build, and we currently cc clang mailin=
g list
> in case there's doublt that this may be a clang prolem instead of kernel.=
 It
> is not specially to whole opoen source community. Is this ok with you?

It is fine to keep testing the repo but the error reporting should go to =

TI not GKH. I am fairly certain he does not care about our tree.

Not sure if there is intelligence in the bot to direct bug reports to =

specific companies or individuals when testing SoC product trees

Dan

--===============2620382653183491514==--

