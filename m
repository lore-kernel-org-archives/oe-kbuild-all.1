Content-Type: multipart/mixed; boundary="===============1325375988234763408=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [arnd-playground:Wextra 5/32] sound/firewire/amdtp-stream.c:1097:43: sparse: sparse: incorrect type in argument 6 (invalid types)
Date: Mon, 19 Oct 2020 15:04:30 +0800
Message-ID: <202010191522.gNkb5Jgv-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1325375988234763408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git=
 Wextra
head:   5d0c476a9aa8d83304ee40320c1533a7443c6af5
commit: 828241168b4b6b303cbba8bf9e1b693a3fd6ed61 [5/32] firewire: fix funct=
ion type cast warning
config: x86_64-randconfig-s021-20201019 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-rc1-2-g368fd9ce-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.g=
it/commit/?id=3D828241168b4b6b303cbba8bf9e1b693a3fd6ed61
        git remote add arnd-playground https://git.kernel.org/pub/scm/linux=
/kernel/git/arnd/playground.git
        git fetch --no-tags arnd-playground Wextra
        git checkout 828241168b4b6b303cbba8bf9e1b693a3fd6ed61
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   sound/firewire/amdtp-stream.c: note: in included file:
   include/linux/firewire.h:434:52: sparse: sparse: attribute __transparent=
_union__ applied to non-union type
>> sound/firewire/amdtp-stream.c:1097:43: sparse: sparse: incorrect type in=
 argument 6 (invalid types) @@     expected union fw_iso_callback_t [userty=
pe] callback @@     got void ( * )( ... ) @@
>> sound/firewire/amdtp-stream.c:1097:43: sparse:     expected union fw_iso=
_callback_t [usertype] callback
>> sound/firewire/amdtp-stream.c:1097:43: sparse:     got void ( * )( ... )
--
   sound/firewire/isight.c: note: in included file:
   include/linux/firewire.h:434:52: sparse: sparse: attribute __transparent=
_union__ applied to non-union type
>> sound/firewire/isight.c:365:52: sparse: sparse: incorrect type in argume=
nt 6 (invalid types) @@     expected union fw_iso_callback_t [usertype] cal=
lback @@     got void ( * )( ... ) @@
>> sound/firewire/isight.c:365:52: sparse:     expected union fw_iso_callba=
ck_t [usertype] callback
>> sound/firewire/isight.c:365:52: sparse:     got void ( * )( ... )

vim +1097 sound/firewire/amdtp-stream.c

7b3b0d8583c926 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
023  =

31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
024  /**
be4a28940a9973 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
025   * amdtp_stream_start - start transferring packets
be4a28940a9973 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
026   * @s: the AMDTP stream to start
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
027   * @channel: the isochronous channel on the bus
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
028   * @speed: firewire speed code
acfedcbe1ce4c6 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
029   * @start_cycle: the isochronous cycle to start the context. Start imm=
ediately
acfedcbe1ce4c6 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
030   *		 if negative value is given.
af86b0b1f4b045 sound/firewire/amdtp-stream.c Takashi Sakamoto 2020-05-08  1=
031   * @queue_size: The number of packets in the queue.
af86b0b1f4b045 sound/firewire/amdtp-stream.c Takashi Sakamoto 2020-05-08  1=
032   * @idle_irq_interval: the interval to queue packet during initial sta=
te.
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
033   *
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
034   * The stream cannot be started until it has been configured with
be4a28940a9973 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
035   * amdtp_stream_set_parameters() and it must be started before any PCM=
 or MIDI
be4a28940a9973 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
036   * device can be started.
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
037   */
a0e023317e2d55 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
038  static int amdtp_stream_start(struct amdtp_stream *s, int channel, int=
 speed,
af86b0b1f4b045 sound/firewire/amdtp-stream.c Takashi Sakamoto 2020-05-08  1=
039  			      int start_cycle, unsigned int queue_size,
af86b0b1f4b045 sound/firewire/amdtp-stream.c Takashi Sakamoto 2020-05-08  1=
040  			      unsigned int idle_irq_interval)
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
041  {
2472cfb3232caf sound/firewire/amdtp-stream.c Takashi Sakamoto 2020-05-08  1=
042  	bool is_irq_target =3D (s =3D=3D s->domain->irq_target);
d3d10a4a1b1950 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-21  1=
043  	unsigned int ctx_header_size;
f11453c7cc010d sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-22  1=
044  	unsigned int max_ctx_payload_size;
2b3fc456febf54 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
045  	enum dma_data_direction dir;
7ab566453fe32d sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
046  	int type, tag, err;
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
047  =

31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
048  	mutex_lock(&s->mutex);
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
049  =

be4a28940a9973 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
050  	if (WARN_ON(amdtp_stream_running(s) ||
4b7da117e5e1cd sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
051  		    (s->data_block_quadlets < 1))) {
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
052  		err =3D -EBADFD;
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
053  		goto err_unlock;
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
054  	}
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
055  =

d3d10a4a1b1950 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-21  1=
056  	if (s->direction =3D=3D AMDTP_IN_STREAM) {
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
057  		// NOTE: IT context should be used for constant IRQ.
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
058  		if (is_irq_target) {
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
059  			err =3D -EINVAL;
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
060  			goto err_unlock;
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
061  		}
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
062  =

b6bc812327aa69 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
063  		s->data_block_counter =3D UINT_MAX;
d3d10a4a1b1950 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-21  1=
064  	} else {
4b7da117e5e1cd sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
065  		s->data_block_counter =3D 0;
d3d10a4a1b1950 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-21  1=
066  	}
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
067  =

2b3fc456febf54 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
068  	/* initialize packet buffer */
2b3fc456febf54 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
069  	if (s->direction =3D=3D AMDTP_IN_STREAM) {
2b3fc456febf54 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
070  		dir =3D DMA_FROM_DEVICE;
2b3fc456febf54 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
071  		type =3D FW_ISO_CONTEXT_RECEIVE;
f11453c7cc010d sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-22  1=
072  		if (!(s->flags & CIP_NO_HEADER))
f11453c7cc010d sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-22  1=
073  			ctx_header_size =3D IR_CTX_HEADER_SIZE_CIP;
f11453c7cc010d sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-22  1=
074  		else
f11453c7cc010d sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-22  1=
075  			ctx_header_size =3D IR_CTX_HEADER_SIZE_NO_CIP;
b18f0cfaf16bee sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1=
076  =

b18f0cfaf16bee sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1=
077  		max_ctx_payload_size =3D amdtp_stream_get_max_payload(s) -
b18f0cfaf16bee sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1=
078  				       ctx_header_size;
2b3fc456febf54 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
079  	} else {
2b3fc456febf54 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
080  		dir =3D DMA_TO_DEVICE;
2b3fc456febf54 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
081  		type =3D FW_ISO_CONTEXT_TRANSMIT;
df9160b9149912 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-21  1=
082  		ctx_header_size =3D 0;	// No effect for IT context.
f11453c7cc010d sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-22  1=
083  =

b18f0cfaf16bee sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1=
084  		max_ctx_payload_size =3D amdtp_stream_get_max_payload(s);
b18f0cfaf16bee sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1=
085  		if (!(s->flags & CIP_NO_HEADER))
b18f0cfaf16bee sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1=
086  			max_ctx_payload_size -=3D IT_PKT_HEADER_SIZE_CIP;
b18f0cfaf16bee sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1=
087  	}
f11453c7cc010d sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-22  1=
088  =

af86b0b1f4b045 sound/firewire/amdtp-stream.c Takashi Sakamoto 2020-05-08  1=
089  	err =3D iso_packets_buffer_init(&s->buffer, s->unit, queue_size,
f11453c7cc010d sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-22  1=
090  				      max_ctx_payload_size, dir);
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
091  	if (err < 0)
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
092  		goto err_unlock;
af86b0b1f4b045 sound/firewire/amdtp-stream.c Takashi Sakamoto 2020-05-08  1=
093  	s->queue_size =3D queue_size;
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
094  =

31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
095  	s->context =3D fw_iso_context_create(fw_parent_device(s->unit)->card,
d3d10a4a1b1950 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-21  1=
096  					  type, channel, speed, ctx_header_size,
2472cfb3232caf sound/firewire/amdtp-stream.c Takashi Sakamoto 2020-05-08 @1=
097  					  amdtp_stream_first_callback, s);
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
098  	if (IS_ERR(s->context)) {
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
099  		err =3D PTR_ERR(s->context);
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
100  		if (err =3D=3D -EBUSY)
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
101  			dev_err(&s->unit->device,
be4a28940a9973 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
102  				"no free stream on this controller\n");
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
103  		goto err_buffer;
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
104  	}
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
105  =

be4a28940a9973 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
106  	amdtp_stream_update(s);
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
107  =

d3d10a4a1b1950 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-21  1=
108  	if (s->direction =3D=3D AMDTP_IN_STREAM) {
f11453c7cc010d sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-22  1=
109  		s->ctx_data.tx.max_ctx_payload_length =3D max_ctx_payload_size;
d3d10a4a1b1950 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-21  1=
110  		s->ctx_data.tx.ctx_header_size =3D ctx_header_size;
d3d10a4a1b1950 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-21  1=
111  	}
52759c0963510a sound/firewire/amdtp-stream.c Takashi Sakamoto 2018-04-29  1=
112  =

3b196c394dd9f8 sound/firewire/amdtp-stream.c Takashi Sakamoto 2017-03-31  1=
113  	if (s->flags & CIP_NO_HEADER)
3b196c394dd9f8 sound/firewire/amdtp-stream.c Takashi Sakamoto 2017-03-31  1=
114  		s->tag =3D TAG_NO_CIP_HEADER;
3b196c394dd9f8 sound/firewire/amdtp-stream.c Takashi Sakamoto 2017-03-31  1=
115  	else
3b196c394dd9f8 sound/firewire/amdtp-stream.c Takashi Sakamoto 2017-03-31  1=
116  		s->tag =3D TAG_CIP;
3b196c394dd9f8 sound/firewire/amdtp-stream.c Takashi Sakamoto 2017-03-31  1=
117  =

a0e023317e2d55 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
118  	s->pkt_descs =3D kcalloc(s->queue_size, sizeof(*s->pkt_descs),
04130cf8e296bf sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1=
119  			       GFP_KERNEL);
04130cf8e296bf sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1=
120  	if (!s->pkt_descs) {
04130cf8e296bf sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1=
121  		err =3D -ENOMEM;
04130cf8e296bf sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1=
122  		goto err_context;
04130cf8e296bf sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1=
123  	}
04130cf8e296bf sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1=
124  =

ec00f5e444706c sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
125  	s->packet_index =3D 0;
4b7da117e5e1cd sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
126  	do {
6007bf5460cc3b sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1=
127  		struct fw_iso_packet params;
e229853d505d7a sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
128  =

b18f0cfaf16bee sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1=
129  		if (s->direction =3D=3D AMDTP_IN_STREAM) {
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
130  			err =3D queue_in_packet(s, &params);
b18f0cfaf16bee sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1=
131  		} else {
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
132  			bool sched_irq =3D false;
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
133  =

b18f0cfaf16bee sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1=
134  			params.header_length =3D 0;
b18f0cfaf16bee sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1=
135  			params.payload_length =3D 0;
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
136  =

60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
137  			if (is_irq_target) {
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
138  				sched_irq =3D !((s->packet_index + 1) %
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
139  					      idle_irq_interval);
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
140  			}
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
141  =

e229853d505d7a sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
142  			err =3D queue_out_packet(s, &params, sched_irq);
b18f0cfaf16bee sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1=
143  		}
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
144  		if (err < 0)
04130cf8e296bf sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1=
145  			goto err_pkt_descs;
4b7da117e5e1cd sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
146  	} while (s->packet_index > 0);
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
147  =

2b3fc456febf54 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
148  	/* NOTE: TAG1 matches CIP. This just affects in stream. */
7ab566453fe32d sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
149  	tag =3D FW_ISO_CONTEXT_MATCH_TAG1;
3b196c394dd9f8 sound/firewire/amdtp-stream.c Takashi Sakamoto 2017-03-31  1=
150  	if ((s->flags & CIP_EMPTY_WITH_TAG0) || (s->flags & CIP_NO_HEADER))
7ab566453fe32d sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
151  		tag |=3D FW_ISO_CONTEXT_MATCH_TAG0;
7ab566453fe32d sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
152  =

7b3b0d8583c926 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1=
153  	s->callbacked =3D false;
acfedcbe1ce4c6 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1=
154  	err =3D fw_iso_context_start(s->context, start_cycle, 0, tag);
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
155  	if (err < 0)
04130cf8e296bf sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1=
156  		goto err_pkt_descs;
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
157  =

31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
158  	mutex_unlock(&s->mutex);
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
159  =

31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
160  	return 0;
04130cf8e296bf sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1=
161  err_pkt_descs:
04130cf8e296bf sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1=
162  	kfree(s->pkt_descs);
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
163  err_context:
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
164  	fw_iso_context_destroy(s->context);
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
165  	s->context =3D ERR_PTR(-1);
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
166  err_buffer:
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
167  	iso_packets_buffer_destroy(&s->buffer, s->unit);
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
168  err_unlock:
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
169  	mutex_unlock(&s->mutex);
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
170  =

31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
171  	return err;
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
172  }
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1=
173  =


:::::: The code at line 1097 was first introduced by commit
:::::: 2472cfb3232caf8f68e4d93ae830c569b0bbc25b ALSA: firewire-lib: add ref=
erence to domain structure from stream structure

:::::: TO: Takashi Sakamoto <o-takashi@sakamocchi.jp>
:::::: CC: Takashi Iwai <tiwai@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1325375988234763408==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
wwEA
--===============1325375988234763408==--

